class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @messages = user.messages
    respond_to do |format|
      format.html
      format.json
    end
  end
end
