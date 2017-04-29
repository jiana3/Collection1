class SessionsController < ApplicationController

  # Before actions to check paramters
  # before_action :check_params, only: [:login]
  before_action :authenticate_user, only: [:logout]

  def unauth
  end

  # Find a user with the username and email pair, log in that user if they exist 
  def login
  	# Find a user with params
  	user_n = User.find_by_username("#{params[:credentials][:username]}")
	user_e = User.find_by_email("#{params[:credentials][:email]}")
  	if user_n && user_n.authenticate("#{params[:credentials][:password]}")
	  	# Save them in the session
	  	log_in user_n
	  	# Redirect to posts page
	  	redirect_to posts_path
	elsif user_e && user_e.authenticate("#{params[:credentials][:password]}")
		log_in user_e
	  	redirect_to posts_path
	else
		redirect_to :back
	end
  end

  # Log out the user in the session and redirect to the unauth thing
  def logout
  	log_out
  	redirect_to login_path 
  end

  # Private controller methods
  # private
  # def check_params
  	# params.require(:credentials).permit(:username, :email)
  	# @credentials = params[:credentials]
  # end

end
