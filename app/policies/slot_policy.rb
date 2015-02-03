class SlotPolicy < ApplicationPolicy
  def index?
    current_user?
  end

  def show?
    true
  end

  def show_many?
    true
  end

  def update_metaslot?
    current_user?
  end

  # current user must exist
  # current user must be allowed to see slot
  def like?
    current_user?
    # TODO: add scope check
  end
end
