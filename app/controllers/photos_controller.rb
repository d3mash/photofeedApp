# frozen_string_literal: true

class PhotosController < ApplicationController
  def index
    @photos = Photo.reorder('created_at DESC').paginate(page: params[:page])
  end

  def create
    home = redirect_to('/')
    if !params[:image]
      home
    else
      PhotosServices.upload(params)
    end
    home
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    not_found if @photo.blank?

    @user = User.find(@photo.user_id)
  end

  def destroy
    PhotoServices.del(Photo.find(params[:id]))
    redirect_to('/')
  end

  private
  def photos_params
    params.require(:photo).permit(:link, :caption, :public_id, :user_id)
  end
end
