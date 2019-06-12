class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @categories = @post.categories
    @users = @post.users.uniq
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], user_ids:[], users_attributes: [:username])
  end
end
