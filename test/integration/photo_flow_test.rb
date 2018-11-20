require 'test_helper'

class PhotoFlowTest < ActionDispatch::IntegrationTest
	test "can create and delete a photo" do
		# next line fixes redirects to https://example.com
		host! '0.0.0.0:3000'
		get "/"
		assert_response :success
		post "/photo/store", params: { caption: 'test caption', public_id: '12442', link: 'mocked-link.com', image: file_fixture('test.jpg') }
		assert_equal 3, Photo.count, 'does not post to database'
		assert_response :redirect
		follow_redirect!
		assert_response :success
		photo = (Photo.find_by caption: 'test caption')
		get "/photo/#{photo.id}"
		assert_response :success
		assert_select 'h1', 'test caption'
		post "/photo/delete", params: {id: photo.id, public_id: photo.public_id}
		assert_response :redirect
		assert_equal 2, Photo.count, 'does not delete from database'
	end
end
