require 'rails_helper'

RSpec.describe "ApplicationHelper" do
  include ApplicationHelper
  describe "ページタイトル" do
    let(:post) { build(:post) }

    it "base_titleのみを表示" do
      expect(full_title("")).to eq "BGMatch"
    end

    it "full_titleを表示" do
      expect(full_title(post.name)).to eq "MyName - BGMatch"
    end
  end
end
