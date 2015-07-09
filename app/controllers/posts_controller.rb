class PostsController < ApplicationController

  def index
    @posts = Post.order(id: :desc)
  end

  def new
    unless current_user
      flash[:alert] = "you must log in to create a post"
      redirect_to(:back)
    else
      @post = Post.new
    end
  end

    def show
      @post = Post.find params[:id]
    end
    def create
      
      @post = current_user.posts.create post_params
      redirect_to post_path(@post.id)
    end

    private

    def post_params
      params.require(:post).permit(:posttitle, :postbody)
    end
    

end
