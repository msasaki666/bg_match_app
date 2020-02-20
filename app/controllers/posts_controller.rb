class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user, participates: [:user]).paginate(page: params[:page])
  end

  def show
    @post = Post.includes(:user, participates: [:user]).paginate(page: params[:page]).find(params[:id])
    @participate = Participate.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "投稿に成功しました"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "編集に成功しました"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "イベントを削除しました"
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:name, :description, :date, :address, :latitude, :longitude, :post_image)
    end
end
