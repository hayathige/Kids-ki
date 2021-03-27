class NoticesController < ApplicationController
    before_action :move_to_top_index
    # noticeコントローラーの領域にはログインユーザー以外は入れなくする。どのアクションもだめ
    
    def index
        @notices = current_user.group.notices.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    end
    
    def new
        @notice = Notice.new
    end
    
    def create
        @notice = Notice.create(title: notice_params[:title], notice: notice_params[:notice], image: notice_params[:image], user_id: current_user.id, group_id: current_user.group_id)
    end
    
    def destroy
        notice = Notice.find(params[:id])
        notice.destroy if notice.user_id == current_user.id
    end
    
    def show
        @notice = Notice.find(params[:id])
        @comments = @notice.comments.includes(:user)
        @comment = Comment.new
    end
    
    def edit
        @notice = Notice.find(params[:id])
    end
    
    def update
        notice = Notice.find(params[:id])
        if notice.user_id == current_user.id
          notice.update(notice_params)
        end
    end
    
    private
    def notice_params
        params.require(:notice).permit(:title, :notice, :image)
    end
    
    def move_to_top_index
        redirect_to  controller: :top, action: :index unless user_signed_in?
        
        # サインインしてなかったら、トップコントローラーのインデックスに飛ばす
    end    
end
