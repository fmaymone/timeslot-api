require 'rails_helper'
require 'ts_prevent_deletion'

describe TSPreventDeletion do
  let(:slot) { FactoryGirl.create(:std_slot) }
  let(:slot_with_media) { FactoryGirl.create(:std_slot_private, :with_note) }

  it "doesn't fail if all objects with references to" \
     " the item to be deleted are also deleted" do
    expect(Rails.logger).not_to receive(:error)
    expect { slot.ts_soft_delete }.not_to raise_error
  end

  it "fails if undeleted references to the item to be deleted exists" do
    expect(Rails.logger).to receive(:error).with(/wasn't deleted \(but should\)/)
    if Rails.env.test?
      expect {
        slot_with_media.ts_soft_delete
      }.to raise_error(/wasn't deleted \(but should\)/)
    else
      slot_with_media.ts_soft_delete
    end
  end
end
