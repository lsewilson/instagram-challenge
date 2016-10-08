# Instagram Challenge
[![Build Status](https://travis-ci.org/lsewilson/instagram-challenge.svg?branch=master)](https://travis-ci.org/lsewilson/instagram-challenge)

This app is a clone of Instagram, built using Ruby on Rails. Users can sign up, post pictures, write comments and like pictures.

## Set up

Create local development and test databases
```
$ createdb instagram_development
$ createdb instagram_test
```
Install [ImageMagick](https://github.com/ImageMagick/ImageMagick) to enable image uploads.
```
$ brew install imagemagick
```
Clone the repository and enter the project folder.
```
$ git clone
$ cd instagram-challenge
```
Set up a .env file by copying the example and filling in with relevant Facebook and AWS keys.
```
$ cp .env.development.example .env
```
Install all gems and migrate databases.
```
$ bundle install
$ rake db:migrate
```
Run the server and visit localhost:3000
```
$ rails s
```
