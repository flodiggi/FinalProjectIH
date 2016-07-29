class Activity < ApplicationRecord
  has_many :user_activities
  has_many :users, through: :user_activities
  has_many :group_activities
  has_many :groups, through: :group_activities
  has_many :time_entries, dependent: :destroy
  has_many :time_votes, dependent: :destroy
  has_many :date_entries, dependent: :destroy
  has_many :date_votes, dependent: :destroy
  has_many :location_entries, dependent: :destroy
  has_many :location_votes, dependent: :destroy
  has_many :comments, dependent: :destroy




  extend TimeSplitter::Accessors
  split_accessor :starts_at, date_format: "%D", time_format: "%I:%M%p"

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/



end
