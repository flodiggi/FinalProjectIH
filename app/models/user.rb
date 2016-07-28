class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true

  validates_uniqueness_of :email, :allow_blank => true, :case_sensitive => false


  has_many :user_activities
  has_many :activities, through: :user_activities

  has_many :user_groups
  has_many :groups, through: :user_groups

  has_many :comments, dependent: :destroy
  has_many :date_votes, dependent: :destroy

    def owned_activities
      user_activities.ownerships.map(&:activity)
    end


    def self.create_with_omniauth(auth)

   user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
   user.password = auth['uid']
   user.name = auth['info']['first_name']
   user.surname = auth['info']['last_name']
   user.age_range = auth.extra.raw_info.age_range
   user.link = auth.extra.raw_info.link
   user.picture = auth['info']['image']
   user.locale = auth.extra.raw_info.locale
   user.gender = auth.extra.raw_info.gender
   user.username = auth['info']['first_name']
   user.save!

   if User.exists?(user)
     user
   else
     user.save!
     user
   end
 end

 def largeimage
   "http://graph.facebook.com/#{self.uid}/picture?type=large"
 end
 def normalimage
  "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end

end
