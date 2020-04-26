class Prefectures::HokkaidosController < ApplicationController
  def index
    @posts = Post.all
  end
end