class UserActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  scope :ownerships, -> { where(:owner => true) }
end
