class LocationVote < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :location_entry
end
