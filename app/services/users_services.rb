# frozen_string_literal: true

module UsersServices
  def save_user(user)
    user.save
    log_in user
    flash.now[:success] = 'Welcome to the photofeedApp!'
    redirect_to user
  end
end
