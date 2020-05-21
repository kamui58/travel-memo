class Prefectures::HokkaidosController < ApplicationController
  def index
    hokkaido = Post.joins(:place).merge(Place.hokkaido)
    @posts = hokkaido
  end
end