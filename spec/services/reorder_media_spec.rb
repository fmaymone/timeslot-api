require 'rails_helper'

RSpec.describe ReorderMedia, type: :service do
  describe "valid_sorting?" do
    it "returns true if order is valid" do
      param = [
        { media_id: 1,
          position: 2 },
        { media_id: 2,
          position: 0 },
        { media_id: 3,
          position: 1 }
      ]
      result = described_class.valid_sorting? param
      expect(result).to eq true
    end

    it "returns false if gaps in the position numbers" do
      param = [
        { media_id: 1,
          position: 3 },
        { media_id: 2,
          position: 0 },
        { media_id: 3,
          position: 1 }
      ]
      result = described_class.valid_sorting? param
      expect(result).to eq false
    end

    it "returns false if the position numbers don't start with 0" do
      param = [
        { media_id: 1,
          position: 2 },
        { media_id: 2,
          position: 3 },
        { media_id: 3,
          position: 1 }
      ]
      result = described_class.valid_sorting? param
      expect(result).to eq false
    end
  end
end
