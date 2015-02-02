require 'rails_helper'
require 'ts_prevent_deletion'

describe TSPreventDeletion do
  let(:slot) { FactoryGirl.create(:std_slot) }
  let(:slot_with_media) { FactoryGirl.create(:std_slot, :with_media, :with_note) }

  it "doesn't fail if all objects with references to" \
     " the item to be deleted are also deleted" do
    expect { slot.ts_soft_delete }.not_to raise_error
  end

  it "fails if undeleted references to the item to be deleted exists" do
    expect {
      slot_with_media.ts_soft_delete
    }.to raise_error(/wasn't deleted \(but should\)/)
    # I would like to check for the error class here, but the identity of the
    # class changes when Rails reloads and doesn't match the cached test env
    # }.to raise_error TSPreventDeletion::AssociationNotDeleted
  end
end
