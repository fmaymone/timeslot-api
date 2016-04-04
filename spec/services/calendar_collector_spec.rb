require 'rails_helper'

RSpec.describe CalendarCollector, type: :service do
  let(:user) { create(:user) }
  let(:user_with_calendars) do
    requestee = create(:user)
    create_list(:group, 3, public: false, owner: requestee)
    requestee
  end
  let!(:public_calendars) do
    publics = create_list(:group, 2, public: true, owner: user_with_calendars)
    public_group = create(:group, public: true)
    shared = create(:membership, :active, group: public_group,
                    user: user_with_calendars)
    publics + [shared]
  end
  let(:service) { described_class.new(user) }

  describe "calendars_for" do
    context 'me' do
      let(:service) { described_class.new(user_with_calendars) }

      it "adds the number of non-public calendars" do
        result = service.calendars_for(user_with_calendars)
        expect(result).to include user_with_calendars.groups.public.first
        expect(result).to include user_with_calendars.groups.public.last
        expect(result).to include user_with_calendars.groups.non_public.first
        expect(result).to include user_with_calendars.groups.non_public.last
      end
    end

    context "user without shared non-public calendars" do
      it "only returns his public calendars" do
        result = service.calendars_for(user_with_calendars)
        expect(result).to include user_with_calendars.groups.public.first
        expect(result).to include user_with_calendars.groups.public.last
        expect(result).not_to include user_with_calendars.groups.non_public.first
        expect(result).not_to include user_with_calendars.groups.non_public.last
      end
    end

    context "user with shared non-public calendars" do
      let!(:shared_nonpublic_calendar) do
        shared_group = create(:group, public: false)
        create(:membership, :active, user: user,
               group: shared_group)
        create(:membership, :active, user: user_with_calendars,
               group: shared_group)
        shared_group
      end

      it "returns public and shared non-public calendars" do
        result = service.calendars_for(user_with_calendars)
        expect(result).to include shared_nonpublic_calendar
        expect(result).to include user_with_calendars.groups.public.first
        expect(result).to include user_with_calendars.groups.public.last
        expect(result).not_to include user_with_calendars.groups.non_public.first
      end
    end
  end
end
