class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[slack]

  has_one :candidate
  has_many :votes
  
  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.name = auth.info.name
    user.avatar_url = auth.extra.raw_info.user_identity.image_512
    user.save
    user
  end

end
