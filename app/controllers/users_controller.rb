# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  # before_action :destroy_photos, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
    not_found if @user.blank?

    @photos = Photo.where(user_id: @user.id).reorder('created_at DESC').paginate(page: params[:page])
  end

  def create
    @user = User.new(users_params)
    if @user.valid?
      type, message = UsersServices.save_user(@user)
      redirect_to root_url
    else
      render('new')
    end
    flash[type] = message
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:success] = 'Profile updated'
      redirect_to(@user)
    else
      render('edit')
    end
  end

  def destroy
    UsersServices.destroy_photos(params[:id])
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to(users_url)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'Please log in.'
    redirect_to(login_url)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  private
    def users_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
