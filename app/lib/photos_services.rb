# frozen_string_literal: true

module PhotosServices
  class << self
    def upload(params, author)
      # upload to cloudinary
      @value = Cloudinary::Uploader.upload(params[:image])

      # create photo instance
      @photo = Photo.new(link: @value['secure_url'], public_id: @value['public_id'],
                           caption: params[:caption], user_id: author)

      # and save it to database
      @photo.save
    end

    def del(photo)
      @value = Cloudinary::Uploader.destroy(photo['public_id'])
      photo.destroy
    end
  end
end
