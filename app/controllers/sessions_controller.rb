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
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end

  end

  def createandlink
    activity = Activity.find_by(id: params[:id])
    if request.env['omniauth.auth']
    user = User.create_with_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to '/profile'
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to ("/activity/#{activity.id}/joinus")
      else
        redirect_to ("/activity/#{activity.id}/join")
      end
    end

  end







  def destroy
    session.clear
    redirect_to '/'

  end


end
