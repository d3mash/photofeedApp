# README

This is a single-page web application designed for sharing photos.
Runs on ruby 2.5.3.

[![Build Status](https://travis-ci.org/d3mash/photofeedApp.svg?branch=master)](https://travis-ci.org/d3mash/photofeedApp) 
[![Maintainability](https://api.codeclimate.com/v1/badges/9c375803480dc8a5800f/maintainability)](https://codeclimate.com/github/d3mash/photofeedApp/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9c375803480dc8a5800f/test_coverage)](https://codeclimate.com/github/d3mash/photofeedApp/test_coverage)
### TO-DO
- [x] Paging 
- [x] Display all users on users#index
- [x] Account activation via email link
- [x] Display all user's posts on user page
- [x] Follow users
To run locally you need: 
* `clone this repo`
* `bundle install`
* Configure `config/local_env.yml` to match [.cloudinary_env_example.yml]([.cloudinary_env_example.yml]) with [Cloudinary](https://cloudinary.com/) keys
* `rake db:migrate`
* `rails server`
