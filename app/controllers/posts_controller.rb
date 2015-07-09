class PostsController < ApplicationController

  def index
    @posts = Post.order(id: :desc).limit(5)
  end

  def show
    

end
