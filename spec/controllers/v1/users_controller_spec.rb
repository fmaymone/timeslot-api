require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do

  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { attributes_for(:user, username: nil) }
  let(:user) { create(:user) }
  let(:valid_session) { {} }

  before(:each) { request.accept = "application/json" }

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, { user: valid_attributes }, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, { user: valid_attributes }, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, { user: invalid_attributes }, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "PATCH update" do
    let!(:user) { create(:user) }

    describe "with valid params" do
      let(:new_attributes) {
        attributes_for(:user, username: "new name")
      }

      it "updates the requested user" do
        patch :update, { id: user.id, user: new_attributes }, valid_session
        user.reload
        expect(user.username).to eq "new name"
      end

      it "assigns the requested user as @user" do
        patch :update, { id: user.id, user: new_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        patch :update, { id: user.id, user: invalid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end
  end

  describe "DELETE destroy" do
    let!(:user) { create(:user) }

    it "destroys the requested user" do
      expect {
        delete :destroy, { id: user.to_param }, valid_session
      }.to change(User, :count).by(-1)
    end
  end
end
