require 'rails_helper'

RSpec.describe SlotQuery::OwnSlots, type: :query do
  describe "my Slots, with pagination" do
    # this is like seed data, create once before all those specs
    before(:all) do
      @current_user = create(:user, :with_email, :with_password)

      # upcoming slots
      create(:std_slot_private,
             start_date: Time.zone.tomorrow,
             title: 'not my upcoming slot')
      @upcoming_slot = create(:std_slot_private,
                              start_date: Time.zone.tomorrow,
                              title: 'upcoming slot',
                              owner: @current_user)
      create(:std_slot_private,
             start_date: Time.zone.today.next_week.end_of_day,
             end_date: Time.zone.today.next_week.next_month,
             title: 'upcoming slot A',
             owner: @current_user)
      create(:std_slot_private,
             start_date: Time.zone.today.next_week.end_of_day,
             end_date: Time.zone.today.next_week.next_month,
             title: 'upcoming slot B',
             owner: @current_user)
      create_list(:std_slot_private, 3,
                  start_date: Time.zone.tomorrow,
                  owner: @current_user)
      # create(:re_slot,
      #        start_date: Time.zone.tomorrow.midday,
      #        end_date: Time.zone.tomorrow.next_week.end_of_day,
      #        title: 'upcoming reslot',
      #        slotter: @current_user)
      # ongoing slots
      create(:std_slot_friends,
             start_date: Time.zone.yesterday,
             end_date: Time.zone.tomorrow,
             title: 'ongoing slot',
             owner: @current_user)
      create_list(:std_slot_friends, 12,
                  start_date: Time.zone.yesterday,
                  end_date: Time.zone.tomorrow,
                  title: 'ongoing slots',
                  owner: @current_user)
      # create(:re_slot,
      #        start_date: Time.zone.yesterday,
      #        end_date: Time.zone.tomorrow,
      #        title: 'ongoing reslot',
      #        slotter: @current_user)
      # past slots
      create(:std_slot_public,
             start_date: Time.zone.yesterday.last_year,
             end_date: Time.zone.today.last_year,
             title: 'long ago slot',
             owner: @current_user)
      create(:std_slot_public,
             start_date: Time.zone.yesterday.at_midday,
             end_date: Time.zone.yesterday.end_of_day,
             title: 'past slot',
             owner: @current_user)
      create_list(:std_slot_public, 13,
                  start_date: Time.zone.yesterday.at_midday,
                  end_date: Time.zone.yesterday.end_of_day,
                  title: 'past slots',
                  owner: @current_user)
      # create(:re_slot,
      #        start_date: Time.zone.yesterday.last_month,
      #        end_date: Time.zone.today.last_month,
      #        title: 'past reslot',
      #        slotter: @current_user)
    end

    describe "mode" do
      it "upcoming" do
        slots = described_class.new(relation: @current_user.std_slots)
        result = slots.retrieve(mode: 'upcoming', moment: Time.zone.now)
        # result set contains StdSlots (but not StdSlotsPrivate etc.)
        # so in order to compare them I need to 'cast' my slot
        # Finally: this seems like a good case for ValueObjects
        slot = StdSlot.find(@upcoming_slot.id)
        expect(result.to_a).to include slot
      end

      it "unknown" do
        slots = described_class.new(relation: @current_user.std_slots)
        expect {
          slots.retrieve(mode: 'unknown', moment: Time.zone.now)
        }.to raise_error ApplicationController::PaginationError
      end

      context "between" do
        let(:user) { create(:user) }
        let(:earliest) { '2016-04-21 11:06:18Z' }
        let(:latest) { '2016-04-21 19:06:18Z' }

        let!(:slots) do
          create(:std_slot_public, owner: user, title: 'in between',
                 start_date: '2016-04-21 15:06:18Z',
                 end_date: '2016-04-21 16:06:18Z'
                )
          create(:std_slot_public, owner: user, title: 'overlap earliest',
                 start_date: '2016-04-21 03:06:18Z',
                 end_date: '2016-04-21 16:06:18Z'
                )
          create(:std_slot_public, owner: user, title: 'overlap latest',
                 start_date: '2016-04-21 15:06:18Z',
                 end_date: '2016-04-21 23:06:18Z'
                )
          create(:std_slot_public, owner: user, title: 'overlap both',
                 start_date: '2016-04-21 05:06:18Z',
                 end_date: '2016-04-21 22:06:18Z'
                )
        end
        let!(:before_slot) do
          create(:std_slot_public, owner: user, title: 'before',
                 start_date: '2016-04-21 01:06:18Z',
                 end_date: '2016-04-21 03:06:18Z'
                )
        end
        let!(:later_slot) do
          create(:std_slot_public, owner: user, title: 'later',
                 start_date: '2016-04-21 20:06:18Z',
                 end_date: '2016-04-21 21:06:18Z'
                )
        end

        it "doesn't return slots outside of requested range" do
          slots = described_class.new(relation: user.std_slots)

          result = slots.retrieve(mode: 'between', earliest: earliest,
                                  latest: latest)

          result.each do |slot|
            expect(slot.end_date).to be > earliest
            expect(slot.start_date).to be < latest
          end
          expect(result).not_to include later_slot
          expect(result).not_to include before_slot
        end
      end
    end
  end
end
