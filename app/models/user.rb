class User < ActiveRecord::Base

  def self.from_omniauth(auth)
   user =  where(uid: auth[:uid]).first_or_create do |new_user|
      new_user.uid          = auth.uid
      new_user.name         = auth.extra.raw_info.name
      new_user.image_url    = auth.extra.raw_info.avatar_url
      new_user.access_token = auth.credentials.token
   end

   logger.debug "#{user}"

    user
  end
end
