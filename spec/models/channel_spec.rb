require 'rails_helper'

RSpec.describe Channel, :focus, type: :model do
  let(:user) { create(:user) }
  let(:device) { create(:device, user: user) }
  let(:device2) { create(:device, user: user) }

  context "Channel subscription", :redis do
    describe "User subscribes to a channel" do
      it "User is subscribed" do
        expect(device.is_connected?).to be(false)
        expect(device2.is_connected?).to be(false)
        expect(device.connection_count).to be(0)

        device.connect
        device2.connect
        devices = user.devices.pluck(:id).map(&:to_s)

        expect(device.is_connected?).to be(true)
        expect(device.connections).to include(devices[0])
        expect(device2.is_connected?).to be(true)
        expect(device2.connections).to include(devices[1])
        expect(device.connection_count).to be(2)
        expect(device2.connection_count).to be(2)
      end
    end

    describe "User unfollows another user" do
      it "User is subscribed" do
        device.connect
        device2.connect

        expect(device.is_connected?).to be(true)
        expect(device2.is_connected?).to be(true)
        expect(device.connection_count).to be(2)

        device.disconnect
        device2.disconnect

        expect(device.is_connected?).to be(false)
        expect(device2.is_connected?).to be(false)
        expect(device.connection_count).to be(0)
        expect(device2.connection_count).to be(0)
      end
    end
  end
end
