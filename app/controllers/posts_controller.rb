class PostsController < ApplicationController

  def index
    @post = Post.new
    @post.build_place
  end
  
  def create
    if user_signed_in?
      @post = Post.create(post_params)
      redirect_to posts_path, notice: "投稿しました"
    else
      flash.now[:alert] = "ログインしてください"
      render :index
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to "/users/#{post.user_id}"
  end

  def edit

  end

  def update

  end

  def show
    
  end

  def search
    if params[:keyword].present?
      @posts = Post.joins(:place).where('name LIKE ? OR prefecture LIKE ? OR municipality LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    else
      @posts = Post.none
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :image, place_attributes:[:name, :address, :prefecture, :municipality]).merge(user_id: current_user.id)
  end
end
