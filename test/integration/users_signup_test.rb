# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'should not register invalid' do
    count = User.count
      post users_path, params: { user: { name:  '',
                                     email: 'user@invalid',
                                     password:              'foo',
                                     password_confirmation: 'bar' } }
        assert count.equal?(User.count), 'Count changed'
  end
end
