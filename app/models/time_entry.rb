class TimeEntry < ApplicationRecord
  belongs_to :activity
  has_many :time_votes, dependent: :destroy
  default_scope { order('time') } 
end
