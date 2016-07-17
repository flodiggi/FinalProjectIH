class ActivityController < ApplicationController

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
  # activity.save
  redirect_to("/activity")
  end
end


def activity
  

end


end
