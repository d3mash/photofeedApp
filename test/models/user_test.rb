# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should be valid' do
    test_user = User.new(
      name: 'Example User',
      email: 'user@example.com',
      password: 'foobar12',
      password_confirmation: 'foobar12')

    assert test_user.valid?, 'valid user entry invalidated'
  end
end
