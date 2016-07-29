class TimeEntriesController < ApplicationController
  layout false

  def create

    if params[:time] != nil

    new_time_entry = TimeEntry.create(time: params[:time], votes: 0)

    @activity = Activity.find_by(id: params[:id])
    @activity.time_entries << new_time_entry
    render "activity/_timevotes"
    end
  end
end
