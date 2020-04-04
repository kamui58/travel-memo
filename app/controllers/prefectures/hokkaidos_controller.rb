class Prefectures::HokkaidosController < ApplicationController
  def index
    @messages = Message.all
  end
end