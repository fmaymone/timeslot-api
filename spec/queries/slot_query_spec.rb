require 'spec_helper'

RSpec.describe SlotQuery::OwnSlots, type: :query do
  before(:each) { DatabaseCleaner.start }
  after(:each) { DatabaseCleaner.clean }

  let(:current_user) { FactoryGirl.create(:user, :with_email, :with_password) }

  let(:upcoming_slot) { FactoryGirl.create(:std_slot_private,
                               start_date: Time.zone.tomorrow,
                               title: 'upcoming slot',
                               owner: current_user) }
  let(:upcoming_slot_a) { FactoryGirl.create(:std_slot_private,
                                 start_date: Time.zone.tomorrow,
                                 end_date: Time.zone.tomorrow,
                                 title: 'upcoming slot A',
                                 owner: current_user) }
  let(:upcoming_slots) { create_list(:std_slot_private, 11,
                                     start_date: Time.zone.tomorrow,
                                     owner: current_user) }
  let(:ongoing_slot) { FactoryGirl.create(:std_slot_friends,
                              start_date: Time.zone.yesterday,
                              end_date: Time.zone.tomorrow,
                              title: 'ongoing slot',
                              owner: current_user) }
  let(:ongoing_slots) { create_list(:std_slot_friends, 12,
                                    start_date: Time.zone.yesterday,
                                    end_date: Time.zone.tomorrow,
                                    owner: current_user) }
  let(:past_slot) { FactoryGirl.create(:std_slot_public,
                           start_date: Time.zone.yesterday.at_midday,
                           end_date: Time.zone.yesterday.end_of_day,
                           title: 'past slot',
                           owner: current_user) }
  let(:past_slots) { create_list(:std_slot_public, 13,
                                 start_date: Time.zone.yesterday.at_midday,
                                 end_date: Time.zone.yesterday.end_of_day,
                                 owner: current_user) }

  describe "status" do
    it "upcoming" do
      upcoming_slot
      slots = described_class.new(relation: current_user.std_slots.unscoped)
      result = slots.retrieve(status: 'upcoming', moment: Time.zone.now)
      expect(result.first.title).to eq upcoming_slot.title
    end
  end
end
