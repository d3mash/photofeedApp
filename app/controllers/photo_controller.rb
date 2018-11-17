class PhotoController < ApplicationController
  def store
    # upload image to cloudinary
    if (params[:image]==nil)
      redirect_to('/')
    else
      @value = Cloudinary::Uploader.upload(params[:image])
      @photo = Photo.new({:link => @value['secure_url'], :public_id => @value['public_id'], :caption => params[:caption]})
      @photo.save
      redirect_to('/') 
    end
  end
  def show
    @photo = Photo.find(params[:id])
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
