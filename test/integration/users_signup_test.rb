# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'should not register invalid' do
    count = User.count

    post users_path, params: {
      user: {
        name:  '',
        email: 'user@invalid',
        password: 'foo',
        password_confirmation: 'bar' } }

    assert count.equal?(User.count), 'Count changed'
  end

  test 'valid signup information with account activation' do
    assert_difference 'User.count', 1 do
    post users_path, params: { user: { name:  'Example User',
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password' } }
    end
    user = assigns(:user)
    post login_path, params: {
      session: {
        email: 'user@example.com',
        password: 'password' } }

    # not activated yet
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not user.activated?
    assert_not is_logged_in?

    # wrong token
    get edit_account_activation_path('invalid token', email: user.email)

    assert_not is_logged_in?

    # wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')

    assert_not is_logged_in?

    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    follow_redirect!

    assert user.reload.activated?
    assert_template 'users/show'
    assert is_logged_in?
  end
end
