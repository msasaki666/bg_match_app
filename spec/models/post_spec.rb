require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post)}

  describe "バリデーション" do
    describe "nameカラム" do
      it "nameがなければ無効な状態である" do
        post.name = nil
        expect(post).not_to be_valid
      end

      it "nameが51字なら無効な状態である" do
        post.name = "a" * 51
        expect(post).not_to be_valid
      end

      it "nameが50字なら有効な状態である" do
        post.name = "a" * 50
        expect(post).to be_valid
      end
    end

    describe "descriptionカラム" do
      it "descriptionがなければ無効な状態である" do
        post.description = nil
        expect(post).not_to be_valid
      end

      it "descriptionが501字なら無効な状態である" do
        post.description = "a" * 501
        expect(post).not_to be_valid
      end

      it "descriptionが500字なら有効な状態である" do
        post.description = "a" * 500
        expect(post).to be_valid
      end
    end

    describe "dateカラム" do
      it "dateがなければ無効な状態である" do
        post.date = nil
        expect(post).not_to be_valid
      end
    end

    describe "addressカラム" do
      it "addressがなければ無効な状態である" do
        post.address = nil
        expect(post).not_to be_valid
      end
    end

    describe "user_idカラム" do
      it "addressがなければ無効な状態である" do
        post.user_id = nil
        expect(post).not_to be_valid
      end
    end
  end

  describe "ジオコーディング" do
    it "addressを与えれば緯度経度を算出する" do
      post.address = "東京駅"
      post.save
      expect(post.latitude).not_to eq 1.5
    end
  end
end
