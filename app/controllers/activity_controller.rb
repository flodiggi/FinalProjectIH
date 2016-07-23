class ActivityController < ApplicationController
before_action :authorize_user

def new

end


def create
  activity = Activity.new(activity_params)


  # activity = Activity.new(
  #   :name => params[:activity][:name].capitalize,
  #   :participants => params[:activity][:number],
  #   :groups => params[:activity][:groups])

  if
  activity.name =~ /^$/ || activity.participants =~ /^$/

  redirect_to("activity/new")
  else
  activity.users << current_user
  activity.save
  redirect_to ("/activity/#{activity.id}")
  end
end


def show
@activity = Activity.find_by(id: params[:id])

end

private

def activity_params
  params.require(:activity).permit(:name, :participants, :groups)
end


end
