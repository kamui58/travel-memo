class Prefectures::TohokusController < ApplicationController
  def index

    iwate = Post.joins(:place).merge(Place.iwate)
    aomori = Post.joins(:place).merge(Place.aomori)
    akita = Post.joins(:place).merge(Place.akita)
    miyagi = Post.joins(:place).merge(Place.miyagi)
    yamagata = Post.joins(:place).merge(Place.yamagata)
    fukushima = Post.joins(:place).merge(Place.fukushima)

    @posts = iwate.or(aomori).or(akita).or(miyagi).or(yamagata).or(fukushima)
  end
end