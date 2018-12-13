# frozen_string_literal: true

module UsersServices
  def save_user(user)
    user.save
    user.send_activation_email
    flash[:info] = 'Please check your email to activate your account.'
    redirect_to root_url
  end

  def destroy_photos(userid)
    logger.debug(userid)
    photos = Photo.where(user_id: userid)
    photos.each do |photo|
      Cloudinary::Uploader.destroy(photo['public_id'])
    end
  end
end
