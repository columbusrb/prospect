# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[slack]

  has_one :candidate, dependent: :destroy
  has_many :votes, dependent: :destroy

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.name = auth.info.name
    user.avatar_url = auth.extra.raw_info.user_identity.image_512
    user.save
    user
  end

  def self.max_vote_count
    ENV['MAX_VOTE_COUNT']&.to_i || 5
  end

  def candidate?
    candidate.present?
  end
end
