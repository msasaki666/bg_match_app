require 'rails_helper'

RSpec.describe Participate, type: :model do
  describe "participateモデル" do
    let(:participate) { create(:participate, user_id: 1,post_id: 1)}

    it "有効な状態である" do
      expect(participate).to be_valid
    end

    it "user_idがnilなら無効な状態である" do
      participate.user_id = nil
      expect(participate).not_to be_valid
    end

    it "post_idがnilなら無効な状態である" do
      participate.post_id = nil
      expect(participate).not_to be_valid
    end
  end
end
