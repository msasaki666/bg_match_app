require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Userリソース" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user )}
    
    describe "ユーザー詳細ページ(users#show)" do
      before do
        get user_path(user.id)
      end

      it "リクエストが成功する" do
        expect(response).to have_http_status(:success)
      end

      it "@userが適切な値を持つ" do
        expect(assigns(:user)).to eq user
      end
    end

    describe "ユーザー情報編集ページ(registrations#edit)" do
      it "リクエストが成功する" do
        sign_in user
        get edit_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "アカウント登録ページ(registrations#new)" do
      it "リクエストが成功する" do
        get sign_up_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "ログインページ(sessions#new)" do
      it "リクエストが成功する" do
        get login_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
