require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  before(:each) {
    request.accept = "application/json"
  }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:valid_attributes) { attributes_for(:user, username: "current user") }
  let(:invalid_attributes) { attributes_for(:user, username: nil) }
  let(:valid_session) { {} }

  describe "GET show" do
    before(:each) {
      request.headers['Authorization'] = "Token token=#{current_user.auth_token}"
    }
    it "assigns the requested user as @user" do
      get :show, { id: current_user.id }, valid_session
      expect(assigns(:user)).to eq(current_user)
    end
  end

  describe "POST create" do
    let(:valid_attributes) { attributes_for(:user, :with_email, :with_password) }

    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, valid_attributes, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, valid_attributes, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end
  end
end
