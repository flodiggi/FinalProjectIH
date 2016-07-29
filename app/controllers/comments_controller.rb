class CommentsController < ApplicationController

  def create
  @activity = Activity.find(params[:id])
  @comment = @activity.comments.create(comment_params)
  @comment.user_id = current_user.id
    if @comment.save
      redirect_to ("/activity/#{@activity.id}")
    else
      flash.now[:danger] = "error"
    end
  end


  def comment_params
    params.require(:comment).permit(:title, :text, :category)
  end



end
