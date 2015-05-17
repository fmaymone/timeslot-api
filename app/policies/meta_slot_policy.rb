class MetaSlotPolicy < ApplicationPolicy
  attr_reader :current_user, :slot

  def initialize(user, slot)
    @current_user = user
    @slot = slot
  end

  # probably only the creator is allowed to do this
  def update_metaslot?
    return false unless current_user?
    return true if current_user == slot.creator
    false
  end
end
