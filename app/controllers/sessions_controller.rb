# frozen_string_literal: true

class SessionsController < ApplicationController
  include SessionsServices
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      create_session(user)
    else
      flash.now[:danger] = 'Invalid credentials, try again'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
