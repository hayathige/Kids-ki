class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @notices = user.notices.order("created_at DESC").page(params[:page]).per(5)
  end
end