# frozen_string_literal: true

module SessionsServices
  def create_session(user)
    flash.now[:success] = "Welcome, #{user.name}!"
    log_in user
    params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    redirect_to user
  end
end
