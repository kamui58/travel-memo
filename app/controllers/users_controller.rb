class UsersController < ApplicationController
  layout "application"
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @messages = user.messages
  end
end
