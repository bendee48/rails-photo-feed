module Photo
  def self.urls(photos)
    photos.map do |photo|
      id = photo['id']
      secret = photo['secret']
      farm_id = photo['farm']
      server_id = photo['server']
      "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
    end
  end
end