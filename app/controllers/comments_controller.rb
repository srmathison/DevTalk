class CommentsController < ApplicationController
  
  def create
    # used relationship with user and comments
    @comment = current_user.comments.create whitelisted_params
    # after create comment this redirect to post index
    redirect_to posts_path
  end

  def show
  end

  private

  def whitelisted_params
    # only the attributes of an individual comment which are permitted here are allowed to save to the comment
    params.require(:comment).permit(:commentbody, :post_id)
  end

end
