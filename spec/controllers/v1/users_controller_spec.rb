require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  before(:each) {
    request.accept = "application/json"
  }
  let(:current_user) { create(:user) }
  let(:valid_attributes) { attributes_for(:user, username: "current user") }
  let(:invalid_attributes) { attributes_for(:user, username: nil) }
  let(:valid_session) { {} }

  describe "GET index" do
    before(:each) {
      request.headers['Authorization'] = "Token token=#{current_user.auth_token}"
    }
    it "assigns all users as @users" do
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([current_user])
    end
  end

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
    let(:valid_attributes) { attributes_for(:user, password: "something") }

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

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, invalid_attributes, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "PATCH update" do
    before(:each) {
      request.headers['Authorization'] = "Token token=#{current_user.auth_token}"
    }
    describe "with valid params" do
      let(:new_attributes) {
        attributes_for(:user, username: "new name")
      }

      it "updates the requested user" do
        patch :update, new_attributes, valid_session
        current_user.reload
        expect(current_user.username).to eq "new name"
      end

      it "assigns the requested user as @user" do
        patch :update, new_attributes, valid_session
        expect(assigns(:user)).to eq(current_user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        patch :update, invalid_attributes, valid_session
        expect(assigns(:user)).to eq(current_user)
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) {
      request.headers['Authorization'] = "Token token=#{current_user.auth_token}"
    }
    it "doesn't destroy the requested user" do
      expect {
        delete :destroy, { }, valid_session
      }.not_to change(User, :count)
    end

    it "sets the deleted_at of the user", :commit do
      delete :destroy, { }, valid_session
      current_user.reload
      expect(current_user.deleted_at).not_to eq nil
    end
  end
end
