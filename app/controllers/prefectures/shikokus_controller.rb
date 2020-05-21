class Prefectures::ShikokusController < ApplicationController
  def index

    kochi = Post.joins(:place).merge(Place.kochi)
    ehime = Post.joins(:place).merge(Place.ehime)
    tokushima = Post.joins(:place).merge(Place.tokushima)
    kagawa = Post.joins(:place).merge(Place.kagawa)

    @posts = kochi.or(ehime).or(tokushima).or(kagawa)
  end
end