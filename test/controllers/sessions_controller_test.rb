# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include SessionsHelper
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end

  test 'should get new' do
    get login_path

    assert_response :success
  end

  test 'should log out' do
    assert current_user?(@user)

    log_out

    assert_not is_logged_in?
  end
  test 'should log out via link' do
    assert current_user?(@user)

    delete '/logout'

    assert_not is_logged_in?
  end
end
