require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  given(:user) { create(:user) }
  given(:another_user) { create(:user) }
  given!(:another_post) { create(:post, user: another_user) }
  given!(:post) { create(:post, user: user) }

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
      expect(page).to have_selector 'a', text: "削除"
      click_on post.name
    end

    expect(current_path).to eq post_path(post.id)
  end
end
