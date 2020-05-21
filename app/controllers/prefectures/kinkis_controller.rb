class Prefectures::KinkisController < ApplicationController
  def index
    
    kyoto = Post.joins(:place).merge(Place.kyoto)
    mie = Post.joins(:place).merge(Place.mie)
    shiga = Post.joins(:place).merge(Place.shiga)
    osaka = Post.joins(:place).merge(Place.osaka)
    nara = Post.joins(:place).merge(Place.nara)
    hyogo = Post.joins(:place).merge(Place.hyogo)
    wakayama = Post.joins(:place).merge(Place.wakayama)

    @posts = kyoto.or(mie).or(shiga).or(osaka).or(nara).or(hyogo).or(wakayama)

  end
end