class User < ActiveRecord::Base
  has_many :tweets

  mount_uploader :avatar, AvatarUploader
end
