# frozen_string_literal: true

class AccountActivationsController < ApplicationController
  include ActivationServices
  def edit
    user = User.find_by(email: params[:email])
    if valid?(user, params)
      user.update(activated: true, activated_at: Time.zone.now)
      activate(user)
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
