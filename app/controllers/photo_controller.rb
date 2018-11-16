class PhotoController < ApplicationController
  def store
    # upload image to cloudinary
    @value = Cloudinary::Uploader.upload(params[:image])
    @photo = Photo.new({:link => @value['secure_url'], :public_id => @value['public_id'], :caption => params[:caption]})
    @photo.save
    redirect_to('/')
  end
  def view(id)
    @photo = Photo.find(id)
  end
  def delete
    @photo = Photo.find(params[:id])
    @value = Cloudinary::Uploader.destroy(@photo['public_id'])
    @photo.destroy
    redirect_to('/')
  end
  def index
    @photos = Photo.all.order("created_at DESC")
  end
end
