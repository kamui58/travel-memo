class PostsController < ApplicationController

  def index
    @post = Post.new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
  
  def create
    @post = Post.create(post_params)
    redirect_to posts_path, notice: "投稿しました"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to "users/#{post.user_id}"
  end

  def edit

  end

  def update

  end

  def show
    
  end

  private

  def post_params
    params.require(:post).permit(:message, :image).merge(user_id: current_user.id)
  end
end
