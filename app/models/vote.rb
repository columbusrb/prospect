class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  validates :candidate, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :candidate }
end
