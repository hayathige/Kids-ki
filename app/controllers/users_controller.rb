class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @notices = user.notices.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
      @user = User.new
  end
    
  # def create
  #     @user = User.create(group_id: group_id_params[:group_id])
  # end
  
  def update
      current_user.update(group_id: group_id_params[:group_id])
  end
  
  private
  def group_id_params
      params.require(:user).permit(:group_id)
  end
  
end

  # def after_sign_in_path_for(resource)
  #   if @user.user_id.nil?
  #     notices_path(resource)
  #   else
  #     new_user_path(resource)
  #   end
  # end