# README

This is a single-page web application designed for sharing photos.
Runs on ruby 2.5.3.

[![Build Status](https://travis-ci.org/d3mash/photofeedApp.svg?branch=master)](https://travis-ci.org/d3mash/photofeedApp) 
[![Maintainability](https://api.codeclimate.com/v1/badges/9c375803480dc8a5800f/maintainability)](https://codeclimate.com/github/d3mash/photofeedApp/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9c375803480dc8a5800f/test_coverage)](https://codeclimate.com/github/d3mash/photofeedApp/test_coverage)
### TO-DO
- [x] Upload
- [x] Move to postgres from sqlite
- [x] Delete
- [x] View for photos
- [x] Authorization
- [x] Bind user and post
- [x] Implement changing user settings

To run locally you need: 
* `clone this repo`
* `bundle install`
* `rake db:migrate`
* `rails server`
