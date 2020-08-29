class PostsController < ApplicationController

  def index

    # provide a list of authors to the view for the filter control
    @authors = Author.all

    # filter the @posts list based on user input

    @posts = Post.by_author(params[:author])

    if params[:date] == "Today"
      @posts = Post.from_today
    else
      @posts = Post.old_news
    end
    # if no filters are applied, show all posts
    # @posts = Post.all
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
