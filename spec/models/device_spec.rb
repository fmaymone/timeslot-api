require 'rails_helper'

RSpec.describe Device, type: :model do
  let(:device) { create(:device) }

  subject { device }

  it { is_expected.to respond_to(:device_id) }
  it { is_expected.to respond_to(:system) }
  it { is_expected.to respond_to(:version) }
  it { is_expected.to respond_to(:token) }
  it { is_expected.to respond_to(:endpoint) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to belong_to(:user).inverse_of(:devices) }

  it { is_expected.to respond_to(:connect) }
  it { is_expected.to respond_to(:disconnect) }
  it { is_expected.to respond_to(:connections) }
  it { is_expected.to respond_to(:is_connected?) }
  it { is_expected.to respond_to(:connection_count) }
  it { is_expected.to respond_to(:redis_key) }

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

  describe :device do
    let(:user) { create(:user) }
    let(:device) { attributes_for(:device) }

    it "adds a new device to the user" do
      expect {
        Device.update_or_create(user, device)
      }.to change(user.devices, :count).by 1
    end

    context "invalid params" do
      it "doesn't add a new device if system was not set" do
        device[:system] = nil
        expect {
          Device.update_or_create(user, device)
        }.not_to change(Device, :count)
      end

      it "doesn't add a new device if version was not set" do
        device[:version] = nil
        expect {
          Device.update_or_create(user, device)
        }.not_to change(Device, :count)
      end

      it "doesn't add a new device if device_id was not set" do
        device[:device_id] = nil
        expect {
          Device.update_or_create(user, device)
        }.not_to change(Device, :count)
      end
    end
  end

  describe :register_endpoint, :aws do
    let(:user) { create(:user) }
    let(:device) { create(:device, user: user) }
    let(:token) { '999a077973ae7af48c835e4a15973be1fe7db412945ead30007e31c4b5f33500' }

    it "adds a new endpoint to the user" do
      expect {
        device.register_endpoint(token)
      }.to change(device, :endpoint)
    end

    context "find older device by token and re-assign to the current device" do
      let!(:device1) { create(:device, :with_endpoint, user: user) }
      let!(:device2) { create(:device, user: user) }
      let(:token) { device1.token }

      it "moves an old endpoint to a new device of the user" do
        expect {
          device2.register_endpoint(token)
        }.to change(Device, :count).by 0
        expect(device2.endpoint).to eq("String")
        expect(device2.token).to eq(device1.token)
        expect(device2.device_id).not_to eq(device1.device_id)
      end
    end

    context "invalid params" do
      it "doesn't add a new device to the user if token is nil" do
        expect {
          device.register_endpoint(nil)
        }.not_to change(device, :endpoint)
      end
    end
  end

  describe :unregister_endpoint, :aws do
    let(:user) { create(:user) }
    let!(:device) { create(:device, :with_endpoint, user: user) }
    let(:token) { device[:token] }

    it "removes an endpoint from the user" do
      expect {
        device.unregister_endpoint
      }.to change(Device, :count).by 0
      expect(device.endpoint).to be(nil)
      expect(device.token).to eq(token)
    end
  end

  describe :notify, :vcr do
    let(:client) { double("client") }
    let(:params) {{ message: { KEY: 'slot_like_notify_plural',
                               ACTOR: 'User1',
                               USER: 'User2',
                               TITLE: 'Titel'}}}
    let(:lang) { 'en' }

    it "sends a push notification message to the client" do
      expect(client).to receive(:publish).with(hash_including(message: /User1 and User2 like your Slot: Titel/))
      Device.notify(client, device, lang, params)
    end
  end

  describe :notify_all, :vcr, :aws, :async do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let!(:device1) { create(:device, :with_endpoint, user: user1) }
    let!(:device2) { create(:device, :with_endpoint, user: user2) }
    let(:params) {{ message: { KEY: 'hello_world' }}}

    it "sends a push notification message to a collection of users" do
      Device.notify_all([user1, user2], params)
    end
  end
end
