require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  test "should get new" do
    get users_new_url
    assert_response :success
  end
  test "should not be valid" do
  	invalid_email = User.new(name: 'Demash', email: 'idon"t haveatsign')
  	assert_not invalid_email.valid?, "invalid email accepted"
  end
  test 'should be valid' do
    test_user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    assert test_user.valid?, "valid user entry invalidated"
  end
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
