class DateEntriesController < ApplicationController
  layout false
  def create
    @date_entry = DateEntry.create(date: nil)
    # @activity = Activity.find_by(id: params[:id])
    # @activity.date_entries << date
    @activity = Activity.last
    render "activity/_datevotes"
  end
end
