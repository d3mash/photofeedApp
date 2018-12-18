# frozen_string_literal: true

module SessionsServices
  class << self
    def try_login(params)
      user = User.find_by(email: params[:session][:email].downcase)
      return unsuccessful_login unless user

      if user.authenticate(params[:session][:password])
        user.activated ? succesful_login(user) : not_activated
      else
        unsuccessful_login
      end
    end

    def unsuccessful_login
      [:danger, t('auth.invalid'), '/login']
    end

    def succesful_login(user)
      [:success, t('auth.successful', name: user.name), user]
    end

    def not_activated
      [:warning, t('auth.succesful'), '/']
    end
  end
end
