class SlotsetManager
  # adds or removes a single slot from a slotset aka calendar
  include TSErrors

  def initialize(current_user:)
    @current_user = current_user
    @private_slots_uuid = current_user.slot_sets['my_private_slots_uuid']
    @friend_slots_uuid = current_user.slot_sets['my_friend_slots_uuid']
    @public_slots_uuid = current_user.slot_sets['my_public_slots_uuid']
    @my_cal_uuid = current_user.slot_sets['my_cal_uuid']
  end

  def add!(slot, slotset)
    case slotset
    when Group # for 'normal' slot groups
      fail TSErrors::SlotGroupDeleted if slotset.deleted_at?

      result = Containership.find_or_initialize_by(slot: slot, group: slotset)
      new_instance = (!result.persisted? && result.save) || result.deleted_at?
      result.update(deleted_at: nil) if result.deleted_at?

      if slotset.public? && !slot.StdSlotPublic?
        slot.update_visibility('public')
      end

      #slot.follow(slotset) # actually not supported
      result.initiator = @current_user if @current_user != slot.creator
      result.create_activity if new_instance

      put_into_schedule_of_members(slot, slotset)

    when my_cal_uuid # for the current users 'schedule'
      # current_user.my_calendar_slots << slot
      result = Passengership.find_or_create_by(slot: slot, user: current_user)
      result.update(show_in_my_schedule: true) unless result.show_in_my_schedule?
      result.update(deleted_at: nil) if result.deleted_at?

      # TODO: ask stani if an activity should be triggered here?
      #current_user.follow(slot)
      #result.initiator = @current_user if @current_user != slot.creator
      #result.create_activity if new_instance
      #   Passengership.find_or_create_by(slot: slot,
      #                                   user: current_user).update(deleted_at: nil)
    when friend_slots_uuid
      slot.update(share_with_friends: true)
      slot.update_visibility('friends') if slot.StdSlotPrivate?
    end
  end

  def remove!(slot, slotset)
    case slotset
    when Group
      fail TSErrors::SlotGroupDeleted if slotset.deleted_at?
      # next if slotset.deleted_at? # would be more graceful

      result = slot.containerships.find_by(group: slotset)
      result.delete if result && result.deleted_at.nil?

      # decrease visibility if slot is removed from last remaining public group
      if slot.StdSlotPublic? && slotset.public? && slot.slot_groups.public.empty?
        if slot.share_with_friends?
          slot.update_visibility('friends')
        else
          slot.update_visibility('private')
        end
      end

      hide_from_schedule_of_members(slot, slotset)

    when my_cal_uuid
      result = current_user.passengerships.find_by(slot: slot)
      result.update(show_in_my_schedule: false) if result
      # TODO: ask stani if an activity should be triggered here?
      #result.remove_activity
    when friend_slots_uuid
      slot.update(share_with_friends: false)
      slot.update_visibility('private') if slot.StdSlotFriends?
    end
  end

  def adjust_visibility(slot, visibility, slotset_uuids)
    case visibility
    when 'private'
      unless private_group_included?(slotset_uuids)
        private_group = Group.find_by uuid: private_slots_uuid
        add!(slot, private_group)
      end
    when 'friends'
      slot.update_visibility('friends')
      slot.update(share_with_friends: true)
      unless private_group_included?(slotset_uuids)
        private_group = Group.find_by uuid: private_slots_uuid
        add!(slot, private_group)
      end
    when 'public'
      slot.update_visibility('public')
      unless public_group_included?(slotset_uuids)
        public_group = Group.find_by uuid: public_slots_uuid
        add!(slot, public_group)
      end
    end
  end

  private

  attr_reader :current_user, :private_slots_uuid, :public_slots_uuid,
              :friend_slots_uuid, :my_cal_uuid

  private def private_group_included?(uuids)
    return false unless uuids
    return true if uuids.include? private_slots_uuid

    uuids.each do |uuid|
      group = Group.find_by uuid: uuid
      return true if group && !group.public?
    end
    false
  end

  private def public_group_included?(uuids)
    return false unless uuids
    return true if uuids.include? public_slots_uuid

    uuids.each do |uuid|
      group = Group.find_by uuid: uuid
      return true if group && group.public?
    end
    false
  end

  # creates a passengership for all group members which have
  # 'show in my schedule' enabled for this group
  private def put_into_schedule_of_members(slot, slotset)
    slotset.active_memberships.find_each do |membership|
      next unless membership.show_slots_in_schedule?

      member = membership.user
      result = Passengership.find_or_create_by(slot: slot, user: member)
      result.update(deleted_at: nil) if result.deleted_at?
      result.update(show_in_my_schedule: true) unless result.show_in_my_schedule?
    end
  end

  # hides the slot for all group members which have
  # 'show in my schedule' enabled for this group/calendar
  private def hide_from_schedule_of_members(slot, slotset)
    slotset.active_memberships.find_each do |membership|
      # skip members which have 'show in my schedule' disabled
      next unless membership.show_slots_in_schedule?

      member = membership.user
      # don't hide slot from schedule if member has other calenders with
      # the same slot where 'show in my schedule' is 'true'
      next if member.calendars_in_schedule.where(id: slot.slot_group_ids).any?

      result = Passengership.find_by(slot: slot, user: member)
      result.update(show_in_my_schedule: false) if result.show_in_my_schedule?
    end
  end
end
