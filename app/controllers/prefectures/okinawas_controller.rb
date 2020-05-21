class Prefectures::OkinawasController < ApplicationController
  def index
    okinawa = Post.joins(:place).merge(Place.okinawa)
    @posts = okinawa

  end
end