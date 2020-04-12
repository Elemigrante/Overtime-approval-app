class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
  def index
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def show
  end
  
  private
  
  def post_params
    params.require(:post).permit(:date, :rationale)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
