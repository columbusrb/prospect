class Candidate < ApplicationRecord
  belongs_to :user, :class_name => "User"
  validates :user_id, uniqueness: { scope: :user_id, message: "one run once per year" }
end
