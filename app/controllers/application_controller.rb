class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    end
    @current_user
  end


  def authorize_user
    unless current_user
      flash[:message] = 'Please log in or register to access this page'
      redirect_to root_path
    end
  end


  protected
  def authenticate_user!
    if current_user
      redirect_to '/profile'
    end
  end



end
