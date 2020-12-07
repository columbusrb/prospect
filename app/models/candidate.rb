class Candidate < ApplicationRecord
  belongs_to :user
  has_many :votes
  validates :user_id, uniqueness: { scope: :user_id, message: "You cannot have multiple entries. You can edit your entry if you want to change something." }

 def vote_count
    votes.count
  end

end
