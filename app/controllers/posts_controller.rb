class PostsController < ApplicationController
	before_filter :require_user, except: [:index, :show]
  before_filter :find_post, only: [:show, :edit, :update, :vote]



  def index
  	@posts = Post.all
   if @posts.nil? then redirect_to login_path end
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def new
  	@post = Post.new
    @commnet = Comment.new
  end

  def create
  	@post= Post.new(params[:post])

  	if @post.save
  		flash[:notice] = "Your post was created."
  		redirect_to posts_path
  	else
  		render 'new' #or :new?
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
