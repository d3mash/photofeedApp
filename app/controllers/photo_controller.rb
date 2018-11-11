class PhotoController < ApplicationController
  def store
    # upload image to cloudinary
    @value = Cloudinary::Uploader.upload(params[:image])
    @photo = Photo.new({:link => @value['secure_url'], :caption => params[:caption]})
    if @photo.save
      Pusher.trigger('photos-channel','new-photo', {
        link: @photo.link,
        caption: @photo.caption
      })
    end 
    redirect_to('/')
  end
  def index
    @photos = Photo.all.order("created_at DESC")
  end
end
