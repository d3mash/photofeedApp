# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    # determine displayed flash and redirect target from try_login service
    type, message, target = SessionsServices.try_login(params)
    flash[type] = message
    if type == :success
      log_in target
      params[:session][:remember_me] == '1' ? remember(target) : forget(target)
    end
    redirect_back_or target.to_s
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
