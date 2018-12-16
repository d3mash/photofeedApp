# frozen_string_literal: true

module ActivationServices
  def try_activate(params)
    user = User.find_by(email: params[:email].downcase)
    return false unless user

    can_activate?(user) ? activate(user) : false
  end

  private
  def activate(user)
    user.activate
    log_in user
    redirect_to user
  end

  def can_activate?(user)
    !user.activated && user.authenticated?(:activation, params[:id])
  end
end
