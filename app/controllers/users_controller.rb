class UsersController < ApplicationController
  def index
    @users = User.all
  end


  def destroy
    @user = User.find(params[:id])
  if @user.destroy
    redirect_to root_path
  end
  end

  def show
  @user = User.find(params[:id])
  end
end
