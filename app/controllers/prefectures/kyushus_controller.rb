class Prefectures::KyushusController < ApplicationController
  def index
    
    miyazaki = Post.joins(:place).merge(Place.miyazaki)
    kumamoto = Post.joins(:place).merge(Place.kumamoto)
    saga = Post.joins(:place).merge(Place.saga)
    kagoshima = Post.joins(:place).merge(Place.kagoshima)
    oita = Post.joins(:place).merge(Place.oita)
    nagasaki = Post.joins(:place).merge(Place.nagasaki)
    fukuoka = Post.joins(:place).merge(Place.fukuoka)

    @posts = miyazaki.or(kumamoto).or(saga).or(kagoshima).or(oita).or(nagasaki).or(fukuoka)

  end
end