class ActivityController < ApplicationController
before_action :authorize_user

def new

end


def create
  activity = Activity.new(
    :name => params[:activity][:name].capitalize,
    :participants => params[:activity][:number],
    :groups => params[:activity][:groups])

  if
  activity.name =~ /^$/ || activity.participants =~ /^$/

  redirect_to("/new")
  else
  activity.users << current_user
  activity.save
  redirect_to("/activity")
  end
end


def index


end


end
