# frozen_string_literal: true

class PhotoController < ApplicationController
  include PhotoServices
  def store
    home = redirect_to('/')
    if !params[:image]
      home
    else
      upload(params)
    end
    home
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end

  def delete
    @photo = Photo.find(params[:id])
    del(@photo)
    @photo.destroy
    redirect_to('/')
  end

  def index
    @photos = Photo.all.order('created_at DESC')
  end
end
