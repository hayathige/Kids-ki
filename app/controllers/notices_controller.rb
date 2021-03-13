class NoticesController < ApplicationController
    
    def index
        @notices = Notice.all

    end
    
    def new
        @notice = Notice.new
    end
    
    def create
        @notice = Notice.create(title: notice_params[:title], notice: notice_params[:notice], image: notice_params[:image])
        # @notice = Notice.create(title: notice_params[:title], notice: notice_params[:notice], image: notice_params[:image], urser_id: current_user.id)
    end
    
    def destroy
    end
    
    def show
    end
    
     def edit
    end
    
    def update
    end
    
    private
    def notice_params
        params.require(:notice).permit(:title, :notice, :image)
    end
    
    
    
end
