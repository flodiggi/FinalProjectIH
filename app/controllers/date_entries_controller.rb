class DateEntriesController < ApplicationController
  layout false

  def create

    if params[:date] != nil

    new_date_entry = DateEntry.create(date: params[:date], votes: 0)

    @activity = Activity.find_by(id: params[:id])
    @activity.date_entries << new_date_entry
    render "activity/_datevotes"
    end
  end

  def update
    date = DateEntry.find_by(id: params[:id])

  end
end
