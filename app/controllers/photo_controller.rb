class PhotoController < ApplicationController
  def store
    # upload image to cloudinary
    @value = Cloudinary::Uploader.upload(params[:image])
    @photo = Photo.new({:link => @value['secure_url'], :caption => params[:caption]})
    @photo.save
    redirect_to('/')
  end
  def delete
    
  end
  def index
    @photos = Photo.all.order("created_at DESC")
  end
end
