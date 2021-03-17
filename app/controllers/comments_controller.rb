class CommentsController < ApplicationController
  
  
  def create
    comment = Comment.create(comment: comment_params[:comment], notice_id: comment_params[:notice_id], user_id: current_user.id)
    # @notice = Notice.create(title: notice_params[:title], notice: notice_params[:notice], image: notice_params[:image], user_id: current_user.id)
    redirect_to "/notices/#{comment.notice.id}"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment).merge(notice_id: params[:notice_id])
  end
  
end
