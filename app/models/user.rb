class User < ActiveRecord::Base
  has_many :tweets

  mount_uploader :avatar, AvatarUploader
  mount_uploader :avatar_two, AvatarUploader
end
