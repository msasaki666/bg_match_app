require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "トップページ(staticpages#home)" do
    let(:user) { create(:user) }

    context "ログインしていない状態" do
      it "リクエストが成功する" do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context "ログイン状態" do
      it "リクエストが成功する" do
        sign_in user
        get root_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
