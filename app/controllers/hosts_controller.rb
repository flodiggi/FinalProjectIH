class HostsController < ApplicationController
  layout false

  def create
    activity = Activity.find_by(id: params[:actid])
    user = User.find_by(id: params[:userid])
    host = Host.create(:userid => user.id)
    activity.hosts << host
    redirect_to :back
  end
end
