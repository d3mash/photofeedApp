# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test 'should redirect to login from index' do
    get users_path

    assert_redirected_to login_url
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

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'should save to db' do
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          name: 'Test',
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password' } }
    end
    # follow_redirect!
    # assert_template 'users/show'
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'should redirect to 404' do
    assert_raise('Not Found') do
      get '/users/200'
    end
  end
  test 'should redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test 'should redirect following when not logged in' do
    get following_user_path(@user)
    assert_redirected_to login_url
  end

  test 'should redirect followers when not logged in' do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end
end
