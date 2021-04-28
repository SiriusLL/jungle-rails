class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
      session[:user_id] = user.id
    if user.save
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end

end
