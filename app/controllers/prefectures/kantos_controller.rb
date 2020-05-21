class Prefectures::KantosController < ApplicationController
  def index

    ibaraki = Post.joins(:place).merge(Place.ibaraki)
    gunma = Post.joins(:place).merge(Place.gunma)
    saitama = Post.joins(:place).merge(Place.saitama)
    kanagawa = Post.joins(:place).merge(Place.kanagawa)
    chiba = Post.joins(:place).merge(Place.chiba)
    tokyo = Post.joins(:place).merge(Place.tokyo)
    tochigi = Post.joins(:place).merge(Place.tochigi)

    @posts = ibaraki.or(gunma).or(saitama).or(kanagawa).or(chiba).or(tokyo).or(tochigi)

  end
end