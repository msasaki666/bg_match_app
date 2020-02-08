class StaticPagesController < ApplicationController
  def home
    @post = Post.new(name: "あ", address: "大阪府大阪市城東区新喜多１丁目３ 京橋駅", latitude: 34.6968122, longitude: 135.5330986)
  end
end
