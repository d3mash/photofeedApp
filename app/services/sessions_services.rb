# frozen_string_literal: true

module SessionsServices
  def try_login(user, session)
    if user
      if user.authenticate(session[:password])
        user.activated ? succesful_login(user, session) : not_activated
      else
        unsuccessful_login
      end
    else
      unsuccessful_login
    end
  end

  def succesful_login(user, session_params)
    flash.now[:success] = "Welcome, #{user.name}!"
    log_in user
    session_params[:remember_me] == '1' ? remember(user) : forget(user)
    redirect_back_or user
  end

  def unsuccessful_login
    flash.now[:danger] = 'Invalid credentials, try again'
    render 'new'
  end

  def not_activated
    message = 'Account not activated. '
    message += 'Check your email for the activation link.'
    flash[:warning] = message
    redirect_to root_url
  end
end
