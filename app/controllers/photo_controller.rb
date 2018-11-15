class PhotoController < ApplicationController
  def store
    # upload image to cloudinary
    @value = Cloudinary::Uploader.upload(params[:image])
    @photo = Photo.new({:link => @value['secure_url'], :caption => params[:caption]})
    @photo.save
    redirect_to('/')
  end
  def delete
    @photo = Photo.find(params[:id])
    @photo.destroy
    # todo - delete from cloud
    redirect_to('/')
  end
  def index
    @photos = Photo.all.order("created_at DESC")
  end
end
