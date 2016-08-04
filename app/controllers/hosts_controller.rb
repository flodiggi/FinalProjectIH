class HostsController < ApplicationController
  layout false

  def create
    @activity = Activity.find_by(id: params[:actid])
    user = User.find_by(id: params[:userid])
    host = Host.create(:userid => user.id)
    @activity.hosts << host
    if
      flash[:success] = "#{user.username} is now a host"
    else
      flash[:error] = "Action failed"
    end
    redirect_to ("/activity/#{@activity.id}")
  end
end
