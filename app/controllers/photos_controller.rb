# frozen_string_literal: true

class PhotosController < ApplicationController
  def index
    @user = current_user
    @photos = if @user
        Photo.where('user_id IN (?) OR user_id = ?', @user.following_ids, @user.id).
          reorder('created_at DESC').
          paginate(page: params[:page])
      else
        Photo.none.
          paginate(page: params[:page])
      end
  end

  def create
    home = redirect_to('/')
    if !params[:image]
      home
    else
      PhotosServices.upload(params, current_user.id)
    end
    home
  end

  def show
    @photo = Photo.find_by!(id: params[:id])

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
