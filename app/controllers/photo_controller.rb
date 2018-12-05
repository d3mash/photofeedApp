# frozen_string_literal: true

class PhotoController < ApplicationController
  include PhotoServices
  def store
    if params[:image].nil?
      redirect_to('/')
    else
      upload(params)
    end
    redirect_to('/')
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end

  def delete
    @photo = Photo.find(params[:id])
    @value = Cloudinary::Uploader.destroy(@photo['public_id'])
    @photo.destroy
    redirect_to('/')
  end

  def index
    @photos = Photo.all.order('created_at DESC')
  end
end
