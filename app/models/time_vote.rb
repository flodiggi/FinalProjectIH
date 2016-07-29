class TimeVote < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :time_entry
end
