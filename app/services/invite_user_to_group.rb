class InviteUserToGroup
  # TODO: send email with invitation
  def self.call(group, user_id)
    invitee = User.find(user_id)
    return if invitee.is_invited?(group.id) || invitee.is_member?(group.id)

    # allow to re-invite kicked/refused/left members:
    membership = invitee.get_membership group
    membership ||= Membership.new(group_id: group.id, user_id: invitee.id)
    if !(membership.invite && membership.save)
      fail ArgumentError, "couldn't create membership for userId #{user_id}"
    end
  end
end
