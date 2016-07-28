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



def voting

activity = Activity.find_by(id: params[:actid])
unchecked = params[:uncheckedboxes]
checked = params[:checkedboxes]



checked.each do |vote|
  if DateVote.exists?(activity_id: activity.id, user_id: current_user.id, date_entry_id: vote)
  datevotechecked  = DateVote.find_by(activity_id: activity.id, user_id: current_user.id, date_entry_id: vote)
  DateVote.update(datevotechecked.id, check: true)
  else
  @datevotechecked = DateVote.new(check: true)
  @datevotechecked.activity_id = activity.id
  @datevotechecked.user_id = current_user.id
  @datevotechecked.date_entry_id = vote
  @datevotechecked.save
  end
end
unchecked.each do |vote|
  if DateVote.exists?(activity_id: activity.id, user_id: current_user.id, date_entry_id: vote)
  datevoteunchecked  = DateVote.find_by(activity_id: activity.id, user_id: current_user.id, date_entry_id: vote)
  DateVote.update(datevoteunchecked.id,check: false)
  end
end


redirect_to ("/activity/#{activity.id}")



end

private

def activity_params
  params.require(:activity).permit(:name, :description, :starts_at, :ends_at, :image, :location)
end


end
