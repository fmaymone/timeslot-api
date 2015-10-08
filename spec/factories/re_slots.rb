FactoryGirl.define do
  factory :re_slot, class: ReSlot, parent: :slot do
    association :slotter, factory: :user, strategy: :build
    association :predecessor, factory: :std_slot_public, strategy: :build

    initialize_with do
      # I think it's not possible to create(:re_slot) with parent & predecessor
      # shouldn't be neccessary anyway
      if attributes[:parent].present?
        attributes[:predecessor] = attributes[:parent]
        attributes[:meta_slot] = attributes[:parent][:meta_slot]
        rs = ReSlot.create_from_slot(predecessor: attributes[:parent],
                                     slotter: slotter)
      else
        # need to overwrite the meta_slot from the slots factory with the
        # meta_slot of the predecessor, otherwise we get wrong meta_slot id
        predecessor.meta_slot = meta_slot
        rs = ReSlot.create_from_slot(predecessor: predecessor, slotter: slotter)
      end
      if attributes[:start_date].present?
        rs.update(start_date: attributes[:start_date])
      end
      if attributes[:end_date].present?
        rs.update(end_date: attributes[:end_date])
      end
      rs.update(title: attributes[:title]) if attributes[:title].present?
      if attributes[:deleted_at].present?
        rs.update(deleted_at: attributes[:deleted_at])
      end
      rs
    end
  end
end
