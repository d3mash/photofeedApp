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

  test 'should not be valid' do
    invalid_email = User.new(name: 'Demash', email: 'idon"t haveatsign')
    assert_not invalid_email.valid?, 'invalid email accepted'
  end

  test 'should follow and unfollow a user' do
    michael = users(:michael)
    archer = users(:archer)
    assert_not michael.following?(archer)

    michael.follow(archer)
    assert archer.followers.include?(michael)
    assert michael.following?(archer)
  end
end
