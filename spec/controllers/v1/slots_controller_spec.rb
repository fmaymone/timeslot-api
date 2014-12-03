require 'rails_helper'

RSpec.describe V1::SlotsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Slot. As you add validations to Slot, be sure to
  # adjust the attributes here as well.
  let(:valid_slot) { create(:meta_slot) }
  let(:valid_attributes) { attributes_for(:meta_slot) }
  let(:invalid_attributes) { attributes_for(:meta_slot, title: nil) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # V1::SlotsController. Be sure to keep this updated too.
  let!(:valid_session) { create(:user) } # current_user

  before(:each) { request.accept = "application/json" }

end
