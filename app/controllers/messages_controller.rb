class MessagesController < ApplicationController
  def index
    @message = Message.new

    # @messages = Message
    # .includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def create
    Message.create(message_params)
    redirect_to messages_path, notice: "投稿しました"
  end


  private

  def message_params
    params.require(:message).permit(:image, :text).merge(user_id: current_user.id)
  end
end
