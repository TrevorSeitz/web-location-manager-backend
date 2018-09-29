class Place < ApplicationRecord
  has_one_attached :image # one-to-one relationship
  # has_many_attached :photos # one-to-many relationship

  scope :by_longitude, -> (min, max) { min && max ? where('longitude >= :min AND longitude <= :max', min: min, max: max) : all }
  scope :by_latitude, -> (min, max) { min && max ? where('latitude >= :min AND latitude <= :max', min: min, max: max) : all }

  API_RESULTS_LIMIT = 100

  def self.search(min_lng:, max_lng:, min_lat:, max_lat:)

    by_latitude(min_lat, max_lat).
      by_longitude(min_lng, max_lng).
      limit(API_RESULTS_LIMIT)
  end

  # def as_json(_opts = {})
  # {
  #   id: id,
  #   name: name,
  #   description: description,
  #   fileName: fileName,
  #   venue: venue,
  #   longitude: longitude,
  #   latitude: latitude,
  #   contactName: contactName,
  #   contactPhone: contactPhone,
  #   email: email,
  #   permit: permit,
  #   # GPSLatitudeRef: GPSLatitudeRef,
  #   # GPSLongitudeRef: GPSLongitudeRef,
  #   image: image,
  #   min_lng: min_lng,
  #   min_lat: min_lat,
  #   max_lng: max_lng,
  #   max_lat: max_lat
  # }
    # cover_photos: covers.map do |x|
    #   {
    #     url: x.photo.url.absolute_url,
    #     name: x.photo_file_name,
    #     id: x.id
    #   }
    # end

# end


end

# Use this in Photo model to validate uploads
# validate :main_picture_format
#
# private
#
# def main_picture_format
#   return unless main_picture.attached?
#   return if main_picture.blob.content_type.start_with? 'image/'
#   main_picture.purge_later
#   errors.add(:main_picture, 'needs to be an image')
# end
