class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |new_user|
      new_user.uid  = auth.uid
      new_user.name = auth.name
    end
  end
end