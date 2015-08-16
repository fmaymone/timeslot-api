require 'rails_helper'

RSpec.describe Device, :aws, type: :model do
  let(:device) { create(:device) }

  subject { device }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:device_id) }
  it { is_expected.to respond_to(:system) }
  it { is_expected.to respond_to(:version) }
  it { is_expected.to respond_to(:token) }
  it { is_expected.to respond_to(:endpoint) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to be_valid }

  describe "when user is not present" do
    before { device.user = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when system is not present" do
    before { device.system = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when version is not present" do
    before { device.version = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when device_id is not present" do
    before { device.device_id = nil }
    it { is_expected.to_not be_valid }
  end

  describe :device, :vcr do
    let(:user) { create(:user) }
    let(:device) {
      attributes_for(:device)
          .extract!(:system,
                    :version,
                    :device_id)
    }

    it "adds a new device to the user" do
      expect {
        Device.detect_or_create(user, device)
      }.to change(user.devices, :count).by 1
    end

    context "invalid params" do
      it "doesn't add a new device" do
        device[:system] = nil
        expect {
          Device.detect_or_create(user, device)
        }.not_to change(Device, :count)
      end

      it "doesn't add a new device" do
        device[:version] = nil
        expect {
          Device.detect_or_create(user, device)
        }.not_to change(Device, :count)
      end

      it "doesn't add a new device" do
        device[:device_id] = nil
        expect {
          Device.detect_or_create(user, device)
        }.not_to change(Device, :count)
      end
    end
  end

  describe :register_endpoint, :vcr do
    let(:user) { create(:user) }
    let(:device) { create(:device, user: user) }
    let(:token) { '999a077973ae7af48c835e4a15973be1fe7db412945ead30007e31c4b5f33500' }

    it "adds a new endpoint to the user" do
      expect {
        device.register_endpoint(token)
      }.to change(device, :endpoint)
    end

    context "find older device by token and re-assign to the current device" do
      let(:device1) { create(:device, :with_endpoint, user: user) }
      let(:device2) { create(:device, user: user) }
      let(:token) { device1.token }

      it "moves an old endpoint to a new device of the user" do
        expect {
          device2.register_endpoint(token)
        }.to change(Device, :count)
        expect(device2.endpoint).to eq(device1.endpoint)
        expect(device2.token).to eq(device1.token)
        expect(device2.device_id).not_to eq(device1.device_id)
      end
    end

    context "invalid params" do
      it "doesn't add a new device to the user" do
        expect {
          device.register_endpoint(nil)
        }.not_to change(device, :endpoint)
      end
    end
  end

  describe :unregister_endpoint, :vcr do
    let(:user) { create(:user, :with_device) }
    let(:token) { '999a077973ae7af48c835e4a15973be1fe7db412945ead30007e31c4b5f33500' }

    it "removes an endpoint from the user" do
      expect {
        device.unregister_endpoint
      }.to change(Device, :count).by 1
    end
  end
end
