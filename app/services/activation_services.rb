# frozen_string_literal: true

module ActivationServices
  def activate(user)
      user.activate
      log_in user
      flash[:success] = 'Account activated'
      redirect_to user
  end

  def valid?(user, params)
    user && !user.activated && user.authenticated?(:activation, params[:id])
  end
end
