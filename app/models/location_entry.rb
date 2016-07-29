class LocationEntry < ApplicationRecord
  belongs_to :activity
  has_many :location_votes, dependent: :destroy
end
