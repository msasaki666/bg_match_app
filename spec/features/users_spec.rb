require 'rails_helper'

RSpec.feature "Users", type: :feature do
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
end

