class UsersController < ApplicationController
	before_action :authenticate, :except=>[:top, :about]
	def authenticate
		redirect_to top_url unless user_signed_in?
	end

  def top
  end

  def about
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @title = "Users"
  end

  def show
  	@user = User.find(params[:id])
    @users = User.all
    @title = "Books"
  end

  def  edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
