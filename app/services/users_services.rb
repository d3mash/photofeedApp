# frozen_string_literal: true

module UsersServices
  class << self
    def save_user(user)
      if user.save
        user.send_activation_email
        true
      else
        false
      end
    end

    def destroy_photos(userid)
      photos = Photo.where(user_id: userid)
      photos.each do |photo|
        Cloudinary::Uploader.destroy(photo['public_id'])
      end
    end
  end
end
