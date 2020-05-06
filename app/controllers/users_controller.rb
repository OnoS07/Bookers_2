class UsersController < ApplicationController
	before_action :authenticate, :except=>[:top, :about]
  before_action :ensure_correct_user, {only:[:edit, :update]}
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
       redirect_to user_path(current_user)
    end
  end



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

    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])

    @book = Book.new
    @books = @user.books
  end

  def  edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


end
