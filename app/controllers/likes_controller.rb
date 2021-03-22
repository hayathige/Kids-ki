class LikesController < ApplicationController
    
    def create
        @like = current_user.likes.create(notice_id: params[:notice_id])
        redirect_back(fallback_location: root_path)
        # １つ前のページに戻るroot_pathは念の為に前のページがなければ最初に戻るということ
    end
    
    def destroy
        @notice = Notice.find(params[:notice_id])
        @like = current_user.likes.find_by(notice_id: @notice.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
    end
    
end
