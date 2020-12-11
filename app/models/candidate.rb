# frozen_string_literal: true

class Candidate < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :user_id, uniqueness: { scope: :user_id, message: 'You cannot have multiple entries. You can edit your entry if you want to change something.' }

  def votes_count
    votes.count
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.new_board_members
    Vote.group(:candidate).order('count_id desc').count('id').first(5).map do |n|
      "#{n.first.first_name} #{n.first.last_name}"
    end
  end

end
