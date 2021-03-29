class TopController < ApplicationController
  before_action :move_to_notice_index
  
  def index
  end
  
  def move_to_notice_index
  redirect_to  controller: :notices, action: :index if user_signed_in?
        
        # サインインしてなかったら、トップコントローラーのインデックスに飛ばす
  end    
  
end
