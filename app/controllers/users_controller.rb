class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
  def create
  	@user = User.new({:name => params[:name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation]}) 
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
  private
    def users_params
      params.require(:users).permit(:name, :email, :password,
                                   :password_confirmation)
    end 
  end