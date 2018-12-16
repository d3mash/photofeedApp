# frozen_string_literal: true

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
      @user = users(:michael)
      @other_user = users(:archer)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)

    patch user_path(@user), params: {
     user: {
      name:  '',
      email: 'foo@invalid',
      password: 'foo',
      password_confirmation: 'bar' } }

    assert_template 'users/edit'
  end

  test 'successful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'

    patch user_path(@user), params: {
      user: {
        name:  'Foo Bar',
        email: 'foo@bar.com',
        password: '',
        password_confirmation: '' } }
    @user.reload

    assert_equal 'Foo Bar', @user.name
    assert_equal 'foo@bar.com', @user.email
  end
  test 'should redirect edit when logged in as wrong user' do
    log_in_as(@other_user)

    get edit_user_path(@user)

    assert_redirected_to '/login'
  end

  test 'should redirect update when logged in as wrong user' do
    log_in_as(@other_user)

    patch user_path(@user), params:
    { user: {
      name: @user.name,
      email: @user.email } }

    assert_redirected_to '/login'
  end

  test 'friendly forwarding' do
    get edit_user_path(@user)
    assert_equal session[:forwarding_url], 'http://www.example.com/users/1/edit'

    log_in_as(@user)

    assert_redirected_to edit_user_url(@user)
  end
end
