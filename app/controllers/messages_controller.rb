class MessagesController < ApplicationController

  def index
    @message = Message.new
    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
    Message.create(message_params)
    redirect_to messages_path, notice: "投稿しました"
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to "/users/#{message.user_id}"
  end

  def edit

  end

  def update

  end

  def show

  end

  private

  def message_params
    params.require(:message).permit(:image, :text).merge(user_id: current_user.id)
  end
end
