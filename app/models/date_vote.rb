class DateVote < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :date_entry
end
