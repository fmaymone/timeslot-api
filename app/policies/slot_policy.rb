class SlotPolicy < ApplicationPolicy
  def index?
    current_user?
  end

  def show?
    current_user?
  end

  def show_many?
    current_user?
  end

  def update_metaslot?
    current_user?
  end
end
