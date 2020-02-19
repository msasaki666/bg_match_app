require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "イベント一覧ページ(posts#index)" do
    it "リクエストが成功する" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "イベント詳細ページ(posts#show)" do
    let(:post) { create(:post)}
    it "リクエストが成功する" do
      get post_path(post.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "イベント作成ページ(posts#new)" do
    let(:user) { create(:user) }
    it "リクエストが成功する" do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "イベント編集ページ(posts#edit)" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user)}
    it "リクエストが成功する" do
      sign_in user
      get edit_post_path(post.id)
      expect(response).to have_http_status(:success)
    end
  end
end
