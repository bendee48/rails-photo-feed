require_relative '../models/photos.rb'

class StaticPagesController < ApplicationController
  include Photo

  def index
    flickr = Flickr.new ENV['photo_feed_key'], ENV['photo_feed_secret']

    if params['flickr-id']
      photos = flickr.people.getPhotos(user_id: params['flickr-id'])
      @user_photos = Photo.urls(photos)
    end
  end
end
