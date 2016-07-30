class CommentsController < ApplicationController
  layout false

  def create
  @activity = Activity.find(params[:id])
  @comment = @activity.comments.create(comment_params)
  @comment.user_id = current_user.id
    if @comment.save
      render "activity/_comments"
    else
      flash.now[:danger] = "error"
    end
  end


  def destroy
    comment = Comment.find_by(id: params[:id])
    @activity = Activity.find_by(id: params[:actid])
    comment.destroy
    render "activity/_comments"
  end

  # def destroy
  #   activity = Activity.find(3)
  #   comment = Comment.find(params[:id])
  #   comment.destroy
  #
  #   respond_to do |format|
  #     format.html { redirect_to ("/activity/#{activity.id}") }
  #     format.json { head :no_content }
  #     format.js   { render :layout => false }
  #   end
  # end



  def comment_params
    params.require(:comment).permit(:title, :text, :category)
  end



end
