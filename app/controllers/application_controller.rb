class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  #adding a controller method, all controllers should have it
  def user_signed_in?
      session[:user_id].present?
  end

  helper_method :user_signed_in?
  # adding a helper_method call as in above, allows the view files (all of them
  # in this case) to have access to this method

  #add a user name to a method across all controllers
  def current_user
    # the technique below is called memoization which fetched the user in this case
    # the first time you call the method and every susequent time it uses
    # the one stored in the @current_user variable
    if user_signed_in?
    @current_user ||= User.find session[:user_id]
    end
  end

  #exposes this method to the view file
  helper_method :current_user

  #define in the application controller to be used by all controllers
  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

end
