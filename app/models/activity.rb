class Activity < ApplicationRecord
  has_many :user_activities
  has_many :users, through: :user_activities
  has_many :group_activites
  has_many :groups, through: :group_activites

end
