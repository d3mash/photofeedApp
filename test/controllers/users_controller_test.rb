# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  test 'should redirect edit when not logged in' do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test 'should not be valid' do
    invalid_email = User.new(name: 'Demash', email: 'idon"t haveatsign')
    assert_not invalid_email.valid?, 'invalid email accepted'
  end
  test 'should be valid' do
    test_user = User.new(name: 'Example User', email: 'user@example.com',
                         password: 'foobar', password_confirmation: 'foobar')
    assert test_user.valid?, 'valid user entry invalidated'
  end
  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
