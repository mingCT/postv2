class PostsController < ApplicationController
	before_filter :require_user, except: [:index, :show]
  before_filter :find_post, only: [:show, :edit, :update, :vote]
  before_filter :ctgry_all, only: [:new, :create, :edit, :update]


  def index

    @posts = Post.all

  end

  
  def show
    @post = Post.find(params[:id])
    @post.user = current_user
    @comment = @post.comments.build
  end

  def new
  	@post = Post.new
    @comment = Comment.new
  end

  def create

  	@post= Post.new(params[:post])
    @post.user = current_user

  	if @post.save
  		flash[:notice] = "Your post was created."

  		redirect_to posts_path
  	else
  		render :new
  	end
  end
  
  def edit
  		@post = Post.find(params[:id])
  end

  def update
    	@post = Post.find(params[:id])
  end





   def find_post
    @post = Post.create(params[:post])
   end

  def vote
    Vote.create(voteable: Post.find(params[:id]), user: current_user, vote: params[:vote])
    flash[:notice] = "your vote was counted"
    redirect_to :back
    
  end



end
