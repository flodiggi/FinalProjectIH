class LocationEntriesController < ApplicationController
  layout false

  def create

    if params[:location] != "" && params[:location] != nil

    new_location_entry = LocationEntry.create(location: params[:location].capitalize, votes: 0)

    @activity = Activity.find_by(id: params[:id])
    @activity.location_entries << new_location_entry
    render "activity/_locationvotes"
    end
  end
end
