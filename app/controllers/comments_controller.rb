class CommentsController < ApplicationController
  
  def create
    # used relationship with user and comments
    @comment = current_user.comments.create whitelisted_params
    redirect_to post_path(@comment.post)
  end

  private

  def whitelisted_params
    params.require(:comment).permit(:body, :post_id)
  end

end
