class PostsController < ApplicationController


  def index
    @authors = Author.all 
    #Array of all authors to feed into the call in the view code

    if !params[:author].blank?
      #If an author is given in the params
      @posts = Post.by_author(params[:author])
      # OLD AND BUSTED: Post.where(author: params[:author])
      #Pull the posts where the author is that author
    elsif !params[:date].blank?
      #Or if a date is given in the params
      if params[:date] == "Today"
        @posts = Post.from_today
        # OLD AND BUSTED Post.where("created_at >=?", Time.zone.today.beginning_of_day)
        #Post the posts that were created at the one time
      else 
        @posts = Post.old_news 
        # OLD AND BUSTED Post.where("created_at <?", Time.zone.today.beginning_of_day)
        #Or the other time, since "Today" or "Not Today" are the only two options here
      end 
    else
      @posts = Post.all 
      #Or else show all the posts like a heathen
    end 
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post))
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end
end
