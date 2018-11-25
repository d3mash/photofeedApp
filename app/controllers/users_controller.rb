class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
  def create
  	@user = User.new({:name => params[:name], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation]}) 
  	if (@user.valid?)
  		@user.save
      flash[:success] = "Welcome to the photofeedApp!"
      redirect_to @user
  	else
  		render('new')
  	end 
  end
  private
    def users_params
      params.require(:users).permit(:name, :email, :password,
                                   :password_confirmation)
    end 
  end