class ActivityController < ApplicationController
before_action :authorize_user

def new
end


def create

activity = Activity.new(activity_params)


  if
  activity.name =~ /^$/
  # || activity.participants =~ /^$/

  redirect_to("activity/new")
  else
  activity.users << current_user
  datevote = DateEntry.create(:date => activity.starts_at)
  activity.date_entries << datevote
  activity.save
  redirect_to ("/activity/#{activity.id}")
  end
end

def update
  activity = Activity.find_by(id: params[:id])
  activity.update_attributes!(activity_params)
  redirect_to ("/activity/#{activity.id}")
end


def show
@activity = Activity.find_by(id: params[:id])
@date_entry = DateEntry.new
@comment = Comment.new

end

private

def activity_params
  params.require(:activity).permit(:name, :description, :starts_at, :ends_at, :image, :location)
end


end
