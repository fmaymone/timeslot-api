require 'rails_helper'

RSpec.describe DatesCollector, type: :service do
  describe :multi_day_slots do
    let(:group) { create(:group) }

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

    let!(:containerships) do
      create(:containership, slot: two_day_slot, group: group)
      create(:containership, slot: three_day_slot, group: group)
      create(:containership, slot: five_day_slot, group: group)
      create(:containership, slot: same_day1, group: group)
      create(:containership, slot: same_day2, group: group)
      create(:containership, slot: est_timezone, group: group)
    end

    it "returns all slots which span more than one day" do
      collector = DatesCollector.new(timezone: '+03:00')
      slots = collector.multi_day_slots(group: group)

      expect(slots).to include two_day_slot
      expect(slots).to include five_day_slot
    end

    it "returns all slots which span more than two days" do
      collector = DatesCollector.new(timezone: '+00:00')
      slots = collector.three_plus_day_slots(group: group)

      expect(slots).not_to include two_day_slot
      expect(slots).to include three_day_slot
      expect(slots).to include five_day_slot
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
