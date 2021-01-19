# frozen_string_literal: true

# Sets Candidates features and methods
class Candidate < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :user_id, uniqueness: { scope: :user_id,
                                    message: 'You cannot have multiple entries.
                                               You can edit your entry if you want to change something.' }
  validates :first_name, :last_name, :bio, :why, presence: true

  delegate :count, to: :votes, prefix: 'votes'

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.new_board_members
    Vote.group(:candidate).order('count_id desc')
        .count('id').first(5).map(&:first)
  end
end
