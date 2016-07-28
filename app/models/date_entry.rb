class DateEntry < ApplicationRecord
  belongs_to :activity
  has_many :date_votes, dependent: :destroy
  default_scope { order('date') } 
end
