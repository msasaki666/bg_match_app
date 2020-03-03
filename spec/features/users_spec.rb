require 'rails_helper'

RSpec.feature "Users", type: :feature do
  given(:user) { create(:user) }
  given(:another_user) { create(:user, name: "じろう") }
  given!(:post) { create(:post, latitude: nil, longitude: nil, user: user) }
  given!(:another_post) { create(:post, user: another_user) }
  given!(:user_participate) { create(:participate, user: user, post: another_post) }
  given!(:another_participate) { create(:participate, user: another_user, post: post) }
  
  scenario "アカウント登録とログインログアウト" do
    visit root_path
    expect(page).to have_title "BGMatch"
    expect(page).to have_css "header"
    expect(page).to have_css ".copy"
    expect(page).to have_css ".input-address"
    expect(page).to have_css ".top-map"
    expect(page).to have_css ".buttons"
    expect(page).to have_css "footer"

    within "header" do
      expect(page).to have_selector 'a#logo', text: "BGMatch"
      expect(page).to have_selector 'a', text: "ホーム"
      expect(page).to have_selector 'a', text: "イベント一覧"
      expect(page).to have_selector 'a', text: "アカウント登録"
      expect(page).to have_selector 'a', text: "ログイン"
    end

    within "footer" do
      expect(page).to have_selector 'small', text: "BGMatch by Motoaki Sasaki"
    end

    within ".buttons" do
      click_on "アカウント登録"
    end

    expect(current_path).to eq sign_up_path
    fill_in "ユーザー名", with: "example"
    fill_in "Eメール", with: "example@example.org"
    fill_in "パスワード", with: "password"
    fill_in "パスワード（確認用）", with: "password"
    click_button "アカウント登録"
    expect(current_path).to eq root_path
    expect(page).to have_selector 'div.alert.alert-notice', text: "アカウント登録が完了しました。"
    expect(page).to have_title "BGMatch"
    expect(page).to have_css "header"
    expect(page).to have_css ".copy"
    expect(page).to have_css ".input-address"
    expect(page).to have_css ".top-map"
    expect(page).to have_no_css ".buttons"
    expect(page).to have_css "footer"

    within "header" do
      expect(page).to have_selector 'a#logo', text: "BGMatch"
      expect(page).to have_selector 'a', text: "ホーム"
      expect(page).to have_selector 'a', text: "イベント一覧"
      expect(page).to have_selector 'a', text: "イベント作成"
      expect(page).to have_selector 'a.dropdown-toggle', text: "アカウント"
    end

    within "footer" do
      expect(page).to have_selector 'small', text: "BGMatch by Motoaki Sasaki"
    end

    within "header" do
      click_on "アカウント"
      expect(page).to have_selector 'a', text: "プロフィール"
      expect(page).to have_selector 'a', text: "設定"
      expect(page).to have_selector 'a', text: "ログアウト"
      click_on "ログアウト"
    end

    expect(page).to have_selector 'div.alert.alert-notice', text: "ログアウトしました。"

    within ".buttons" do
      click_on "ログイン"
    end

    expect(current_path).to eq login_path
    fill_in "Eメール", with: "example@example.org"
    fill_in "パスワード", with: "password"
    click_button "ログイン"
    expect(current_path).to eq root_path
    expect(page).to have_selector 'div.alert.alert-notice', text: "ログインしました。"
  end

  scenario "ユーザー詳細ページ" do
    sign_in user
    visit user_path(user.id)

    within ".created-events" do
      expect(page).to have_selector 'a', text: post.name
    end

    within ".participated-events" do
      expect(page).to have_selector 'a', text: another_post.name
      click_on another_post.name
    end

    expect(current_path).to eq post_path(another_post.id)
    expect(page).to have_selector 'h4', text: another_post.description
    expect(page).to have_selector 'h3', text: "参加するユーザー ( 2人 )"
    expect(page).to have_css "#map"
    expect(page).not_to have_selector 'a.btn.btn-info', text: "イベント編集"
    expect(page).not_to have_selector 'a.btn.btn-danger', text: "イベント削除"

    within ".participated-users" do
      expect(page).to have_selector 'a', text: user.name
      expect(page).to have_selector 'a', text: another_user.name
    end

    click_on "参加を取り消す"

    within ".participated-users" do
      expect(page).not_to have_selector 'a', text: user.name
    end

    expect(page).to have_selector 'h3', text: "参加するユーザー ( 1人 )"
    click_on "アカウント"
    click_on "プロフィール"
    expect(current_path).to eq user_path(user.id)

    within ".participated-events" do
      expect(page).not_to have_selector 'a', text: another_post.name
      expect(page).to have_selector 'p', text: "参加するイベントはありません"
    end

    within ".created-events" do
      expect(page).to have_selector 'a', text: post.name
      click_on post.name
    end

    expect(current_path).to eq post_path(post.id)
    expect(page).to have_selector 'h1', text: post.name
    expect(page).to have_selector 'h3', text: "位置情報を表示できません"
    expect(page).to have_selector 'a.btn.btn-info', text: "イベント編集"
    expect(page).to have_selector 'a.btn.btn-danger', text: "イベント削除"
    click_on "イベント編集"
    expect(current_path).to eq edit_post_path(post.id)
    expect(page).to have_css "input#post_name"
    expect(page).to have_css "input#post_date"
    expect(page).to have_css "input#post_address"
    expect(page).to have_css "textarea#post_description"
    expect(page).to have_css "input#post_post_image"
  end
end
