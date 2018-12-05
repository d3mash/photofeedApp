class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :index, :update]
  before_action :correct_user,   only: [:edit, :update]
  def index
  end
  def show
  	@user = User.find(params[:id])
  end
  def create
  	@user = User.new(users_params) 
  	if (@user.valid?)
  		@user.save
      log_in @user
      flash.now[:success] = "Welcome to the photofeedApp!"
      redirect_to @user
  	else
      flash.now[:danger] = "Please verify validity of your information"
  		render('new')
  	end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(users_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  private
    def users_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end 
  end