class Video < ApplicationRecord

  belongs_to :user

  mount_uploader :file, AvatarUploader

  # def set_success(format, opts)
  #   self.success = true
  # end

end
