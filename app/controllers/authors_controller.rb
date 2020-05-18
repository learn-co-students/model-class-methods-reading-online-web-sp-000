class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def index
    @authors = Author.all
    # filter the @posts list based on user input
    if !params[:author].blank?
      @posts = Post.by_author(params[:author])
    elsif !params[:date].blank?
      if params[:date] == "Today"
        @posts = Post.from_today
      else
        @posts = Post.old_news
      end
    else
      # if no filters are applied, show all posts
      @posts = Post.all
    end
  end
end
