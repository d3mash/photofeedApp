# frozen_string_literal: true

User.create!(name:  'Example User',
             email: 'example@railstutorial.org',
             password:              'foobar12',
             password_confirmation: 'foobar12',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
60.times do |n|
  Photo.create!(link: 'https://res.cloudinary.com/dzgpmfcbr/image/upload/v1544700147/nf3d8vhzbdgw5tdzqbov.jpg',
                caption: 'Hello',
                created_at: Time.zone.now,
                updated_at: Time.zone.now,
                user_id: '1',
                public_id: 'nf3d8vhzbdgw5tdzqbov')
end
