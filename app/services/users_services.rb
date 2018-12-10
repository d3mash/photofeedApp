# frozen_string_literal: true

module UsersServices
  def save_user(user)
    user.save
    user.send_activation_email
    flash[:info] = 'Please check your email to activate your account.'
    redirect_to root_url
  end
end
