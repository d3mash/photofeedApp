# frozen_string_literal: true

module PhotoServices
  def upload(params)
    @value = Cloudinary::Uploader.upload(params[:image])
    @photo = Photo.new(link: @value['secure_url'], public_id: @value['public_id'],
                         caption: params[:caption], user_id: current_user.id)
    @photo.save
  end
end
