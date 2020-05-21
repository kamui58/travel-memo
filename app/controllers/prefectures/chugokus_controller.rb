class Prefectures::ChugokusController < ApplicationController
  def index
    
    okayama = Post.joins(:place).merge(Place.okayama)
    hiroshima = Post.joins(:place).merge(Place.hiroshima)
    yamaguchi = Post.joins(:place).merge(Place.yamaguchi)
    tottori = Post.joins(:place).merge(Place.tottori)
    shimane = Post.joins(:place).merge(Place.shimane)

    @posts = okayama.or(hiroshima).or(yamaguchi).or(tottori).or(shimane)

  end
end