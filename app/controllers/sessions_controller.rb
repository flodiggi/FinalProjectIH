class SessionsController < ApplicationController
  def new

  end

  def create
    if request.env['omniauth.auth']
    user = User.create_with_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to '/profile'
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to 'profile'
      else
        redirect_to '/login'
      end
    end

  end

  def destroy
    session.clear
    redirect_to '/'

  end


end
