require 'spec_helper'

describe SoftDeleteService  do
  let(:user) { FactoryGirl.create(:user) }

  describe :call do
    describe "passing valid parameters" do
      it "returns true" do
        expect(SoftDeleteService.call(user)).to eq true
      end

      it "is updates deleted_at column" do
        expect(user.deleted_at).to eq nil
        SoftDeleteService.call(user)
        expect(user.deleted_at).not_to eq nil
      end
    end
  end
end
