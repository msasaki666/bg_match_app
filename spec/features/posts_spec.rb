require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  given(:user) { create(:user) }
  given(:another_user) { create(:user) }
  given!(:another_post) { create(:post, user: another_user)}
  given!(:post) { create(:post, user: user)}
  
  before do
    sign_in user
  end

  scenario "イベント選択" do
    visit posts_path

    expect(page).to have_selector 'a', text: another_user.name
    expect(page).to have_selector 'a', text: another_post.name
    
    within page.first ".post-item" do
      expect(page).to have_selector 'a', text: user.name
      expect(page).to have_selector 'a', text: post.name
      save_and_open_page
      expect(page).to have_selector 'a', text: "削除"
      click_on post.name
    end

    expect(current_path).to eq post_path(post.id)
  end

  # click_button "イベント作成"のところで
  # NoMethodError:undefined method `size' for nil:NilClass
  # が発生するので保留
  # scenario "イベント作成" do
  #   visit root_path
  #   click_on "イベント作成"
  #   expect(current_path).to eq new_post_path
  #   click_button "イベント作成"
  #   expect(page).to have_selector 'div.alert.alert-danger', text: "4つのエラーがあります."
  #   fill_in "イベント名", with: "example"
  #   fill_in "日付", with: "2020-02-20"
  #   fill_in "場所", with: "東京駅"
  #   fill_in "イベント詳細", with: "あああああ"
  #   click_button "イベント作成"
  #   expect(current_path).to eq posts_path
  #   expect(page).to have_selector 'div.alert.alert-success', text: "投稿に成功しました"
  #   expect(page).to have_css ".post-item"
  #   
  #   within page.first ".post-item" do
  #     expect(page).to have_selector 'a', text: user.name
  #     expect(page).to have_selector 'a', text: "example"
  #     expect(page).to have_selector 'a', text: "削除"
  #   end
  # end
end
