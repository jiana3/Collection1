class UsersController < ApplicationController
  # def index
    # @users = Post.all.reverse
  # end
  
  def new
	@user = User.new
  end

  def create
	@user = User.new(user_params)
	if @user.save
	  session[:user_id] = @user.id
	  redirect_to 'sessions/unauth'
	else
	  redirect_to 'signup'
	end
  end

  def edit
  end

  def destroy
    @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	  end
  end
  
  private
  def set_user
      @user = User.find(params[:id])
    end
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :bio, :username, :password, :password_confirmation)
  end
end
