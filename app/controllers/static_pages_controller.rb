# require_relative '../models/photos'

class StaticPagesController < ApplicationController
  # include Photo

  def index
    flickr = Flickr.new ENV['photo_feed_key'], ENV['photo_feed_secret']

    if params['flickr-id']
      begin
        photos = flickr.people.getPhotos(user_id: params['flickr-id'])
        @user_photos = Photo.urls(photos)
      rescue
        flash.now.notice = "That Flickr ID isn't recognised."
      end
    end
  end
end
