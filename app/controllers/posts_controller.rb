class PostsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @posts = Post.all.reverse
  end

  def create
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id
    )
    
    redirect_to '/'
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content]
    )
    
    redirect_to '/'
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end
  
  def add_comment
    Comment.create(
      content: params[:content],
      post_id: params[:id],
      user_id: current_user.id
    )
    
    redirect_to :back
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
