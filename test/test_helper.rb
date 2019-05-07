# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end

require_relative '../config/environment'
require 'rails/test_help'
require 'webmock/minitest'

class ActiveSupport::TestCase
    fixtures :all
    def log_in_as(user)
      session[:user_id] = user.id
    end

    def is_logged_in?
      session[:user_id]
    end
end
class ActionDispatch::IntegrationTest
  # Log in as a particular user.
  def log_in_as(user, password: '12345678', remember_me: '1')
    post login_path, params: {
      session: {
      email: user.email,
      password: password,
      remember_me: true } }
  end
end
  # Add more helper methods to be used by all tests here...
