class User < ApplicationRecord
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.username = auth_hash['info']['username']
      user.name = auth_hash['info']['name']
      user.url = auth_hash['info']['url']
      user.image_url = auth_hash['info']['imageUrl']
      user.token = auth_hash['credentials']['token']
      user.refresh_token = auth_hash['credentials']['refresh_token']
      user.save!
      user
    end
  end
end
