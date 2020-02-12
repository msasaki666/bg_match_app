class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page]).includes(:user)
  end

  def show
    @post = Post.includes(:user, :participates).find(params[:id])
    @participate = Participate.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "イベントを削除しました"
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:name, :description, :date, :address, :latitude, :longitude)
    end
end
