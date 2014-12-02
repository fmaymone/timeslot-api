require 'spec_helper'

describe SoftDelete do
  let(:user) { FactoryGirl.create(:user) }

  describe :call do
    describe "passing valid parameters" do
      it "returns true" do
        expect(SoftDelete.call(user)).to eq true
      end

      it "is updates deleted_at column" do
        expect(user.deleted_at).to eq nil
        SoftDelete.call(user)
        expect(user.deleted_at).not_to eq nil
      end
    end
  end
end
