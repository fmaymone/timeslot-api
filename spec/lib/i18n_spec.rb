require 'rails_helper'

RSpec.describe "I18n" do
  after(:each) { I18n.locale = I18n.default_locale }
  let(:user) { create(:user) }
  let(:slot) { create(:std_slot_private, creator: user) }

  it "Set default locale if no language is set" do
    I18n.locale = I18n.default_locale
    expect(I18n.t('test_message')).to eq("test_message_en")
  end

  it "Set locale to specific language code" do
    I18n.locale = 'de'
    expect(I18n.t('test_message')).to eq("test_message_de")
  end

  it "Pass parameters to localized string content" do
    I18n.locale = 'de'
    result = I18n.t('push_comment', name: user.username, title: slot.title)
    expect(result).to eq("#{user.username} hat kommentiert auf: #{slot.title}")
  end
end
