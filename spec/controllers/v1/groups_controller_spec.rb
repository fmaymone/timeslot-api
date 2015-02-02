require 'rails_helper'

RSpec.describe V1::GroupsController, type: :controller do
  before(:each) {
    request.accept = "application/json"
    request.headers['Authorization'] = "Token token=#{current_user.auth_token}"
  }

  let(:current_user) { create(:user) }
  let(:valid_attributes) do
    attr = attributes_for(:group)
    attr.transform_keys { |key| key.to_s.camelize(:lower) }
  end
  let(:invalid_attributes) { attributes_for(:group, name: nil) }
  let(:valid_session) { {} }

  describe "GET show" do
    let(:group) { create(:group, owner: current_user) }

    it "assigns the requested group as @group" do
      get :show, { group_id: group.id }, valid_session
      expect(assigns(:group)).to eq(group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, valid_attributes, valid_session
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, valid_attributes, valid_session
        expect(assigns(:group)).to be_a(Group)
        expect(assigns(:group)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        post :create, invalid_attributes, valid_session
        expect(assigns(:group)).to be_a_new(Group)
      end
    end
  end

  describe "PATCH update" do
    let(:group) { create(:group, owner: current_user) }

    describe "with valid params" do
      it "updates the requested group" do
        patch :update, { group_id: group.id, name: "new group name" },
              valid_session
        group.reload
        expect(group.name).to eq "new group name"
      end
    end
  end

  describe "DELETE destroy" do
    let!(:group) { create(:group, owner: current_user) }

    it "doesn't destroy the requested group" do
      expect {
        delete :destroy, { group_id: group.id }, valid_session
      }.not_to change(Group, :count)
    end

    it "sets deleted_at on the requested group" do
      delete :destroy, { group_id: group.id }, valid_session
      group.reload
      expect(group.deleted_at?).to be true
    end
  end
end
