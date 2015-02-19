class MetaSlotPolicy < ApplicationPolicy
  attr_reader :user, :slot

  def initialize(user, slot)
    @user = user
    @slot = slot
  end

  # probably only the creator is allowed to do this
  def update_metaslot?
    return false unless current_user?
    return true if user == slot.creator
    false
  end
end
