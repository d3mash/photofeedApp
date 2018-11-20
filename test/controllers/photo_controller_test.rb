require 'test_helper'

class PhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get @photo_index
    assert_response :success
  end
  test "should get store" do
    get @photo_store
    assert_response :success
  end
  test "should get show:" do
  	get @photo_show
  	assert_response :success
  end
  test "should get delete:" do
    get @photo_delete
    assert_response :success
  end
end
