# frozen_string_literal: true

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test 'should not work without a file' do
    photo = Photo.new

    assert_not photo.save, 'Saved empty photo'
  end

  test 'should write to database' do
    photo = Photo.new(link: 'link', public_id: '3414', caption: 'i am in db', user_id: '1')

    photo.save

    assert Photo.exists?(caption: 'i am in db'), 'does not write to db'
  end

  test 'should delete from database' do
    photo = Photo.new(link: 'toDelete', public_id: '42000')

    photo.save
  end
end
