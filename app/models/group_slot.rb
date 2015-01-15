class GroupSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :group, inverse_of: :group_slots

  validates :group, presence: true

  def delete
    super
    group.members.each do |user|
      meta_slot.unregister user
    end
    group.touch
  end
end
