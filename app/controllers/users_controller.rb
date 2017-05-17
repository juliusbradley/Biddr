class UsersController < ApplicationController

  def new
  @user = User.new
end

def create
  @user = User.new user_params
  if @user.save
    sign_in(@user)
    redirect_to root_path, notice: "Sign up successful!"
  else
    flash[:alert] = "Sign up unsuccessful."
    render :new
  end
end

private

def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
end

def find_user
  @user = User.find current_user.id
end
end
