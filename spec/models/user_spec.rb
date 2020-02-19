require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user)}
  let(:participate) { create(:participate, user: user, post: post)}

  describe "バリデーション" do
    it "nameがなければ無効な状態である" do
      user.name = nil
      expect(user).not_to be_valid
    end

    it "nameが51字なら無効な状態である" do
      user.name = "a" * 51
      expect(user).not_to be_valid
    end

    it "nameが50字なら有効な状態である" do
      user.name = "a" * 50
      expect(user).to be_valid
    end
  end

  describe "already_participated? メソッド" do
    it "不参加時はfalseを返す" do
      expect(user.already_participated?(post)).to eq false
    end

    it "参加時はtrueを返す" do
      participate.user_id = user.id
      participate.post_id = post.id
      expect(user.already_participated?(post)).to eq true
    end
  end
end
