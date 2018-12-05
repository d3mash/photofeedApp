# frozen_string_literal: true

class SessionsController < ApplicationController
  include SessionsServices
  def create
    sessionparams = params[:session]
    user = User.find_by(email: sessionparams[:email].downcase)
    try_login(user, sessionparams)
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
