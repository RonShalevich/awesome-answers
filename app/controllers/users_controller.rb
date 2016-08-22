class UsersController < ApplicationController

  def new
    @user = User.new
    # cookies.signed[:message] = "hello"
    # session[:message] = "Hello"
  end

  def create
    @user = User.new user_params
    if @user.save
      # cookies[:user_id] = @user.id
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thanks for signing up!"
    else
      flash[:alert] = "Please fix errors below."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
