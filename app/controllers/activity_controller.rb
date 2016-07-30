class ActivityController < ApplicationController

  def new
  end

  def access
    @activity = Activity.find_by(id: params[:id])

  end

  def login
      activity = Activity.find_by(id: params[:id])
      if activity && activity.authenticate(params[:password])
        if current_user
        activity.users << current_user
        redirect_to ("/activity/#{activity.id}")
        else
        redirect_to ("/activity/#{activity.id}/signup")
        end
      else
        redirect_to ("/activity/#{activity.id}/joinus")
      end

  end


  def signup
    @activity = Activity.find_by(id: params[:id])
  end


  def create

  activity = Activity.new(activity_params)


    if
    activity.name =~ /^$/
    # || activity.participants =~ /^$/

    redirect_to("activity/new")
    else
    activity.users << current_user
    host = Host.create(:userid => current_user.id)
    dateentry = DateEntry.create(:date => activity.starts_at)
    timeentry = TimeEntry.create(:time => activity.starts_at)
    locationentry = LocationEntry.create(:location => activity.location)
    activity.hosts << host
    activity.date_entries << dateentry
    activity.time_entries << timeentry
    activity.location_entries << locationentry
    activity.save
    redirect_to ("/activity/#{activity.id}")
    end
  end

  def update
    activity = Activity.find_by(id: params[:id])
    activity.update_attributes!(activity_params)
    activity.update(locationvoting: activity_params[:locationvoting] == "true" ? true : false)
    activity.update(datevoting: activity_params[:datevoting] == "true" ? true : false)
    activity.update(timevoting: activity_params[:timevoting] == "true" ? true : false)
    redirect_to ("/activity/#{activity.id}")
  end


  def show
  @activity = Activity.find_by(id: params[:id])
  authorize_activity(@activity)
  @date_entry = DateEntry.new
  @time_entry = DateEntry.new
  @location_entry = DateEntry.new
  @comment = Comment.new

  end



  def votingdate

    @activity = Activity.find_by(id: params[:actid])
    unchecked = params[:uncheckedboxes]
    checked = params[:checkedboxes]

    # vote is equal to date_entry id (value of checkboxes, stored as array entries in checked/unchecked):
    checked.to_a.each do |vote|
      if DateVote.exists?(activity_id: @activity.id, user_id: current_user.id, date_entry_id: vote)
      datevotechecked  = DateVote.find_by(activity_id: @activity.id, user_id: current_user.id, date_entry_id: vote)
      DateVote.update(datevotechecked.id, check: true)
      else
      @datevotechecked = DateVote.new(check: true)
      @datevotechecked.activity_id = @activity.id
      @datevotechecked.user_id = current_user.id
      @datevotechecked.date_entry_id = vote
      @datevotechecked.save
      end
    end
    unchecked.to_a.each do |vote|
      if DateVote.exists?(activity_id: @activity.id, user_id: current_user.id, date_entry_id: vote)
      datevoteunchecked  = DateVote.find_by(activity_id: @activity.id, user_id: current_user.id, date_entry_id: vote)
      DateVote.update(datevoteunchecked.id,check: false)
      end
    end

    @activity.date_entries.each do |d|
    d.votes = d.date_votes.where(check: true).count
    d.save
    end

    sorted = @activity.date_entries.sort_by &:votes
    date = sorted.last.date
    dt = DateTime.new(date.year, date.month, date.day, @activity.starts_at.hour, @activity.starts_at.min, @activity.starts_at.sec, @activity.starts_at.zone)

    @activity.update(starts_at: dt)
    @activity.save
    render "activity/_datevotes"

  end

  def votingtime

    @activity = Activity.find_by(id: params[:actid])
    unchecked = params[:uncheckedboxes]
    checked = params[:checkedboxes]

    # vote is equal to date/time/location_entry id (value of checkboxes, stored as array entries in checked/unchecked):
    checked.to_a.each do |vote|
      if TimeVote.exists?(activity_id: @activity.id, user_id: current_user.id, time_entry_id: vote)
      timevotechecked  = TimeVote.find_by(activity_id: @activity.id, user_id: current_user.id, time_entry_id: vote)
      TimeVote.update(timevotechecked.id, check: true)
      else
      @timevotechecked = TimeVote.new(check: true)
      @timevotechecked.activity_id = @activity.id
      @timevotechecked.user_id = current_user.id
      @timevotechecked.time_entry_id = vote
      @timevotechecked.save
      end
    end
    unchecked.to_a.each do |vote|
      if TimeVote.exists?(activity_id: @activity.id, user_id: current_user.id, time_entry_id: vote)
      timevoteunchecked  = TimeVote.find_by(activity_id: @activity.id, user_id: current_user.id, time_entry_id: vote)
      TimeVote.update(timevoteunchecked.id,check: false)
      end
    end

    @activity.time_entries.each do |d|
    d.votes = d.time_votes.where(check: true).count
    d.save
    end

    sorted = @activity.time_entries.sort_by &:votes
    time = sorted.last.time

    dt = DateTime.new(@activity.starts_at.year, @activity.starts_at.month, @activity.starts_at.day, time.hour, time.min, time.sec, time.zone)

    @activity.update(starts_at: dt)
    @activity.save


    render "activity/_timevotes"

  end


  def votinglocation

    @activity = Activity.find_by(id: params[:actid])
    unchecked = params[:uncheckedboxes]
    checked = params[:checkedboxes]

    # vote is equal to date_entry id (value of checkboxes, stored as array entries in checked/unchecked):
    checked.to_a.each do |vote|
      if LocationVote.exists?(activity_id: @activity.id, user_id: current_user.id, location_entry_id: vote)
      locationvotechecked  = LocationVote.find_by(activity_id: @activity.id, user_id: current_user.id, location_entry_id: vote)
      LocationVote.update(locationvotechecked.id, check: true)
      else
      @locationvotechecked = LocationVote.new(check: true)
      @locationvotechecked.activity_id = @activity.id
      @locationvotechecked.user_id = current_user.id
      @locationvotechecked.location_entry_id = vote
      @locationvotechecked.save
      end
    end
    unchecked.to_a.each do |vote|
      if LocationVote.exists?(activity_id: @activity.id, user_id: current_user.id, location_entry_id: vote)
      locationvoteunchecked  = LocationVote.find_by(activity_id: @activity.id, user_id: current_user.id, location_entry_id: vote)
      LocationVote.update(locationvoteunchecked.id,check: false)
      end
    end

    @activity.location_entries.each do |d|
    d.votes = d.location_votes.where(check: true).count
    d.save
    end

    sorted = @activity.location_entries.sort_by &:votes
    @activity.update(location: sorted.last.location)
    @activity.save

    render "activity/_locationvotes"

  end




  private

  def activity_params
    params.require(:activity).permit(:name, :description, :starts_at, :ends_at, :image, :location, :password, :password_confirmation, :locationvoting, :datevoting, :timevoting)
  end


end
