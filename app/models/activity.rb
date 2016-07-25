class Activity < ApplicationRecord
  has_many :user_activities
  has_many :users, through: :user_activities
  has_many :group_activities
  has_many :groups, through: :group_activities

  extend TimeSplitter::Accessors
  split_accessor :starts_at, date_format: "%D", time_format: "%I:%M%p"


end
