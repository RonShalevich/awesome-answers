class SessionsController < ApplicationController

  def new
    
  end

  def create
    # only gives you one
    user = User.find_by_email params[:email]

    # gives you a relation for a search in a the SQL
    # user = User.where email: params[:email]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed In"
    else
      flash[:alert] = "Wrong credentials!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out!"
  end

end
