require 'rails_helper'

RSpec.describe NewUser, type: :service do
  describe "create new user" do
    let(:user_params) {
      attributes_for(:user)
      # attributes_for(:user, password: 'something')
    }

    context "basic user (real human)" do
      let(:service) { described_class.new(user_params: user_params) }

      it "adds a new user to the database" do
        expect { service.create_new_user }.to change(User, :count).by 1
      end

      it "adds 2 new calendars to the database" do
        expect { service.create_new_user }.to change(Group, :count).by 2
      end

      it "sets the default role for the user" do
        service.create_new_user

        expect(User.last.role).to eq "basic"
        expect(User.last.basic?).to be true
      end

      it "doesn't add a new device to the database" do
        expect { service.create_new_user }.not_to change(Device, :count)
      end

      describe "with device" do
        let(:device_params) { attributes_for(:device) }
        let(:service) {
          described_class.new(user_params: user_params,
                              device_params: device_params) }

        it "adds a new device to the database" do
          expect { service.create_new_user }.to change(Device, :count).by 1
        end
      end

      describe "invalid params" do
        it "doesn't create a new user if username is nil" do
          user_params[:username] = nil
          expect { service.create_new_user }.not_to change(User, :count)
        end
      end
    end

    context "curator" do
    end
  end

  describe "create or signin via social" do
  end
end
