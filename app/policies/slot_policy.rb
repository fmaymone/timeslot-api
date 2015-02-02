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
end
