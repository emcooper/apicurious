class User < ApplicationRecord
  attr_reader :num_followers,
              :num_following,
              :profile_picture,
              :num_starred_repos

  def initialize(attributes)
    @num_followers = attributes[:followers]
    @num_following = attributes[:following]
    @num_starred_repos = attributes[:num_starred_repos]
    @profile_picture = attributes[:avatar_url]
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.username           = auth_info.extra.raw_info.login
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
      new_user.profile_picture    = auth_info.extra.raw_info.avatar_url
    end
  end
end
