class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.posts_by current_user
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post         = Post.new(post_params)
    @post.user_id = current_user.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    authorize @post
  end
  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post }
        flash[:info] = "Post was updated."
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @post.delete
    respond_to do |format|
      format.html { redirect_to posts_path, alert: 'Post was successfully deleted.' }
    end
  end
  
  def show
  end
  
  private
  
  def post_params
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
