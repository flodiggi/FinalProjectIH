class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :user_activities
  has_many :activities, through: :user_activities

  has_many :user_groups
  has_many :groups, through: :user_groups

    def owned_activities
      user_activities.ownerships.map(&:activity)
    end

end
