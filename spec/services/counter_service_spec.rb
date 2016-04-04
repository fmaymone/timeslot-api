require 'rails_helper'

RSpec.describe CounterService, type: :service do
  let(:user) { create(:user) }
  let(:user_with_calendars) do
    requestee = create(:user)
    create_list(:group, 3, public: false, owner: requestee)
    requestee
  end
  let!(:public_calendar_count) do
    create_list(:group, 2, public: true, owner: user_with_calendars)
    public_group = create(:group, public: true)
    create(:membership, :active, group: public_group, user: user_with_calendars)
    3
  end

  describe "active_visible_calendars" do
    context 'for me' do
      it "adds the number of non-public calendars" do
        count = described_class.new.active_visible_calendars(
          asker: user_with_calendars, requestee: user_with_calendars)
        expect(count).to eq user_with_calendars.active_memberships.count
      end
    end

    context 'for user without shared non-public calendars' do
      it "only returns the number of public calendars" do
        count = described_class.new.active_visible_calendars(
          asker: user, requestee: user_with_calendars)
        expect(count).to eq public_calendar_count
      end
    end

    context 'for user with shared non-public calendars' do
      let!(:shared_nonpublic_calendar) do
        shared_group = create(:group, public: false)
        create(:membership, :active, user: user,
               group: shared_group)
        create(:membership, :active, user: user_with_calendars,
               group: shared_group)
        shared_group
      end

      it "adds the number of shared non-public calendars" do
        count = described_class.new.active_visible_calendars(
          asker: user, requestee: user_with_calendars)
        expect(count).to eq public_calendar_count + 1
      end
    end
  end
end
