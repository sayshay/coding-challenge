class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    if params[:search]
      @posts = Post.search(params[:search])
    else
      @posts = Post.all
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
        redirect_to @post
      else
        render :new
      end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
