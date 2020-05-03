class UsersController < ApplicationController
	before_action :authenticate, :except=>[:top]
	def authenticate
		redirect_to top_url unless user_signed_in?
	end

  def top
  end

  def show
  end


end
