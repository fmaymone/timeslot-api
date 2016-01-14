FactoryGirl.define do
  factory :re_slot, class: ReSlotPublic, parent: :slot do
    association :slotter, factory: :user, strategy: :build
    association :predecessor, factory: :std_slot_public, strategy: :build

    factory :re_slot_public, class: ReSlotPublic do
      visibility 'public'
    end

    factory :re_slot_foaf, class: ReSlotFoaf do
      visibility 'foaf'
    end

    factory :re_slot_friends, class: ReSlotFriends do
      visibility 'friends'
    end

    factory :re_slot_private, class: ReSlotPrivate do
      visibility 'private'
    end

    initialize_with do
      # I think it's not possible to create(:re_slot) with parent & predecessor
      # shouldn't be neccessary anyway
      visi = (respond_to? :visibility) ? visibility : nil
      if attributes[:parent].present?
        attributes[:predecessor] = attributes[:parent]
        attributes[:meta_slot] = attributes[:parent][:meta_slot]
        rs = ReSlot.create_from_slot(predecessor: attributes[:parent],
                                     slotter: slotter,
                                     visibility: visi)
      else
        # need to overwrite the meta_slot from the slots factory with the
        # meta_slot of the predecessor, otherwise we get wrong meta_slot id
        predecessor.meta_slot = meta_slot
        rs = ReSlot.create_from_slot(predecessor: predecessor,
                                     slotter: slotter,
                                     visibility: visi)
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
      if attributes[:tagged_from].present?
        rs.update(tagged_from: attributes[:tagged_from])
      end
      rs
    end

    after :create do |reslot|
      reslot.slotter.follow(reslot.predecessor)
    end
  end
end
