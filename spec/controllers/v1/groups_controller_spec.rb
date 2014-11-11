require 'rails_helper'

RSpec.describe V1::GroupsController, type: :controller do
  before(:each) { request.accept = "application/json" }

  let!(:owner) { create(:user) }
  let(:valid_attributes) { attributes_for(:group, owner_id: owner.id) }
  let(:invalid_attributes) { attributes_for(:group, name: nil) }
  let(:valid_session) { {} }

  describe "GET index" do
    let(:group) { create(:group, owner: owner) }

    it "assigns all groups as @groups" do
      get :index, {}, valid_session
      expect(assigns(:groups)).to eq([group])
    end
  end

  describe "GET show" do
    let(:group) { create(:group, owner: owner) }

    it "assigns the requested group as @group" do
      get :show, { group_id: group.id }, valid_session
      expect(assigns(:group)).to eq(group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, { group: valid_attributes }, valid_session
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, { group: valid_attributes }, valid_session
        expect(assigns(:group)).to be_a(Group)
        expect(assigns(:group)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        post :create, { group: invalid_attributes }, valid_session
        expect(assigns(:group)).to be_a_new(Group)
      end
    end
  end

  describe "PATCH update" do
    let(:group) { create(:group, owner: owner) }

    describe "with valid params" do
      let(:new_attributes) {
        attributes_for(:group, name: "new group name")
      }

      it "updates the requested group" do
        patch :update, { group_id: group.id, group: new_attributes },
              valid_session
        group.reload
        expect(group.name).to eq "new group name"
      end

      it "assigns the requested group as @group" do
        patch :update, { group_id: group.id, group: valid_attributes },
              valid_session
        expect(assigns(:group)).to eq(group)
      end
    end

    describe "with invalid params" do
      it "assigns the group as @group" do
        patch :update, { group_id: group.id, group: invalid_attributes },
              valid_session
        expect(assigns(:group)).to eq(group)
      end
    end
  end

  describe "DELETE destroy" do
    let!(:group) { create(:group) }

    it "doesn't destroy the requested group" do
      expect {
        delete :destroy, { group_id: group.id }, valid_session
      }.not_to change(Group, :count)
    end

    it "sets deleted_at on the requested group" do
      delete :destroy, { group_id: group.id }, valid_session
      group.reload
      expect(group.deleted_at).not_to eq nil
    end
  end
end
