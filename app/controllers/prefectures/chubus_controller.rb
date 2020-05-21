class Prefectures::ChubusController < ApplicationController
  def index
    
    aichi = Post.joins(:place).merge(Place.aichi)
    gifu = Post.joins(:place).merge(Place.gifu)
    yamanashi = Post.joins(:place).merge(Place.yamanashi)
    niigata = Post.joins(:place).merge(Place.niigata)
    shizuoka = Post.joins(:place).merge(Place.shizuoka)
    ishikawa = Post.joins(:place).merge(Place.ishikawa)
    nagano = Post.joins(:place).merge(Place.nagano)
    toyama = Post.joins(:place).merge(Place.toyama)
    fukui = Post.joins(:place).merge(Place.fukui)

    @posts = aichi.or(gifu).or(yamanashi).or(niigata).or(shizuoka).or(ishikawa).or(nagano).or(toyama).or(fukui)

  end
end