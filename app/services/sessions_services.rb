# frozen_string_literal: true

module SessionsServices
  class << self
    def try_login(params)
      user = User.find_by(email: params[:session][:email].downcase)

      return unsuccessful_login unless user

      return unsuccessful_login unless user.authenticate(params[:session][:password])

      return user.activated ? succesful_login(user) : not_activated
    end

    private
    def unsuccessful_login
      [:danger, 'Invalid credentials, try again', '/login']
    end

    def succesful_login(user)
      [:success, "Welcome, #{user.name}!", user]
    end

    def not_activated
      message = 'Account not activated. '
      message += 'Check your email for the activation link.'
      [:warning, message, '/']
    end
  end
end
