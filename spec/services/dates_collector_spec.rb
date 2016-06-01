require 'rails_helper'

RSpec.describe DatesCollector, type: :service do
  let(:two_day_slot) { create(:slot, title: 'two days',
                              start_date: '2016-02-01', end_date: '2016-02-02')
  }
  let(:three_day_slot) { create(:slot, title: 'three days',
                                start_date: '2016-03-01', end_date: '2016-03-03') }
  let(:five_day_slot) { create(:slot, title: 'five days',
                               start_date: '2016-01-01', end_date: '2016-01-05') }
  let(:same_day1) { create(:slot, title: 'same day 1',
                           start_date: '2016-03-30', end_date: '2016-03-30') }
  let(:same_day2) { create(:slot, title: 'same day 2',
                           start_date: '2016-03-30',
                           end_date: '2016-03-30T23:59:59') }
  let(:est_timezone) { create(:slot, title: 'est timezone sameday',
                              start_date: "2016-05-18T07:59:58.554-05:00",
                              end_date: "2016-05-18T023:59:58.554-05:00") }

  describe :my_calendar_dates do
    let(:current_user) { create(:user) }
    let!(:private_slot) do
      slot = create(:std_slot_private, creator: current_user,
                    owner: current_user, start_date: '2011-03-30',
                    end_date: '2011-03-31')
      create(:passengership, slot: slot, user: current_user,
             show_in_my_schedule: true)
      slot
    end
    let!(:passengerships) do
      create(:passengership, slot: two_day_slot, user: current_user)
      create(:passengership, slot: five_day_slot, user: current_user)
      create(:passengership, slot: est_timezone, user: current_user)
    end

    it "returns all dates for slots in the users my_calendar" do
      collector = DatesCollector.new(current_user: current_user)
      dates = collector.special_set_slots_dates(uuid: current_user.my_cal_uuid)

      expect(dates).to include private_slot.start_date.to_date.as_json
      expect(dates).to include private_slot.end_date.to_date.as_json
      expect(dates).to include two_day_slot.start_date.to_date.as_json
      expect(dates).to include two_day_slot.end_date.to_date.as_json
      expect(dates).to include five_day_slot.start_date.to_date.as_json
      expect(dates).to include five_day_slot.end_date.to_date.as_json
      expect(dates).to include est_timezone.start_date.to_date.as_json
      expect(dates).to include est_timezone.end_date.to_date.as_json
    end
  end

  describe :my_library_dates do
    let(:current_user) { create(:user) }

    context 'created slots' do
      let!(:private_slot) do
        slot = create(:std_slot_private, creator: current_user,
                      owner: current_user, start_date: '2011-03-30',
                      end_date: '2011-03-31')
        create(:passengership, slot: slot, user: current_user,
               show_in_my_schedule: true)
        slot
      end

      it "returns the dates" do
        collector = DatesCollector.new(current_user: current_user)
        dates = collector.special_set_slots_dates(uuid: current_user.my_lib_uuid)

        expect(dates).to include private_slot.start_date.to_date.as_json
        expect(dates).to include private_slot.end_date.to_date.as_json
      end
    end

    context 'my calendar slots' do
      let!(:passengerships) do
        create(:passengership, slot: two_day_slot, user: current_user,
               show_in_my_schedule: false)
        create(:passengership, slot: five_day_slot, user: current_user,
               show_in_my_schedule: true)
        create(:passengership, slot: est_timezone, user: current_user,
               show_in_my_schedule: false, add_media_permission: true)
      end

      it "returns the dates" do
        collector = DatesCollector.new(current_user: current_user)
        dates = collector.special_set_slots_dates(uuid: current_user.my_lib_uuid)

        expect(dates).to include two_day_slot.start_date.to_date.as_json
        expect(dates).to include two_day_slot.end_date.to_date.as_json
        expect(dates).to include five_day_slot.start_date.to_date.as_json
        expect(dates).to include five_day_slot.end_date.to_date.as_json
        expect(dates).to include est_timezone.start_date.to_date.as_json
        expect(dates).to include est_timezone.end_date.to_date.as_json
      end
    end

    context 'slots where user is tagged' do
      let!(:passengerships) do
        create(:passengership, slot: two_day_slot, user: current_user,
               show_in_my_schedule: false, add_media_permission: false)
        create(:passengership, slot: three_day_slot, user: current_user,
               deleted_at: '2012-11-11', add_media_permission: true)
        create(:passengership, slot: five_day_slot, user: current_user,
               show_in_my_schedule: true, add_media_permission: true)
        create(:passengership, slot: est_timezone, user: current_user,
               show_in_my_schedule: false, add_media_permission: true)
      end

      it "returns the dates" do
        collector = DatesCollector.new(current_user: current_user)
        dates = collector.special_set_slots_dates(uuid: current_user.my_lib_uuid)

        expect(dates).not_to include three_day_slot.start_date.to_date.as_json
        expect(dates).not_to include three_day_slot.end_date.to_date.as_json
        expect(dates).to include two_day_slot.start_date.to_date.as_json
        expect(dates).to include two_day_slot.end_date.to_date.as_json
        expect(dates).to include five_day_slot.start_date.to_date.as_json
        expect(dates).to include five_day_slot.end_date.to_date.as_json
        expect(dates).to include est_timezone.start_date.to_date.as_json
      end
    end

    context 'group slots where user is active member' do
      let(:group) do
        group = create(:group)
        create(:membership, :active, group: group, user: current_user)
        group
      end
      let!(:containerships) do
        create(:containership, slot: three_day_slot, group: group)
        create(:containership, slot: same_day1, group: group)
        create(:containership, slot: same_day2, group: group)
      end

      it "returns the dates" do
        collector = DatesCollector.new(current_user: current_user)
        dates = collector.special_set_slots_dates(uuid: current_user.my_lib_uuid)

        expect(dates).to include three_day_slot.start_date.to_date.as_json
        expect(dates).to include three_day_slot.end_date.to_date.as_json
        expect(dates).to include same_day1.start_date.to_date.as_json
        expect(dates).to include same_day2.end_date.to_date.as_json
      end
    end
  end

  describe :date_series_for_slots do
    let(:group) { create(:group) }
    let!(:containerships) do
      create(:containership, slot: two_day_slot, group: group)
      create(:containership, slot: three_day_slot, group: group)
      create(:containership, slot: five_day_slot, group: group)
      create(:containership, slot: same_day1, group: group)
      create(:containership, slot: same_day2, group: group)
      create(:containership, slot: est_timezone, group: group)
    end

    it "returns all dates where the slots happen" do
      collector = DatesCollector.new
      slots = group.slots.joins(:meta_slot)
      dates = collector.date_series_for_slots(slot_collection: slots).to_json

      expect(dates).to include '2016-02-01'
      expect(dates).to include '2016-02-02'
      expect(dates).to include '2016-03-01'
      expect(dates).to include '2016-03-02'
      expect(dates).to include '2016-03-03'
      expect(dates).to include '2016-01-01'
      expect(dates).to include '2016-01-02'
      expect(dates).to include '2016-01-03'
      expect(dates).to include '2016-01-04'
      expect(dates).to include '2016-01-05'
      expect(dates).to include '2016-03-30'
      expect(dates).to include '2016-05-18'
      expect(dates).to include '2016-05-19'
    end

    # TODO: test timezone more thoroughly
    context "other timezone" do
      it "returns all dates where the slots happen" do
        collector = DatesCollector.new(timezone: '-05:00')
        slots = group.slots.joins(:meta_slot)
        dates = collector.date_series_for_slots(slot_collection: slots).to_json

        expect(dates).to include '2016-02-01'
        expect(dates).to include '2016-01-31'
        expect(dates).to include '2016-03-01'
        expect(dates).to include '2016-03-02'
        expect(dates).to include '2016-02-29'
        expect(dates).to include '2016-01-01'
        expect(dates).to include '2016-01-02'
        expect(dates).to include '2016-01-03'
        expect(dates).to include '2016-01-04'
        expect(dates).to include '2015-12-31'
        expect(dates).to include '2016-03-29'
        expect(dates).to include '2016-03-30'
        expect(dates).to include '2016-05-18'
        expect(dates).not_to include '2016-05-19'
      end
    end
  end
end
