class Place < ApplicationRecord
  has_one_attached :image # one-to-one relationship
  # has_many_attached :photos # one-to-many relationship

  scope :by_longitude, -> (min, max) { min && max ? where('longitude >= :min AND longitude <= :max', min: min, max: max) : all }
  scope :by_latitude, -> (min, max) { min && max ? where('latitude >= :min AND latitude <= :max', min: min, max: max) : all }

  API_RESULTS_LIMIT = 100

  def self.search(min_lat:, max_lat:, min_lng:, max_lng:)
    by_latitude(min_lat, max_lat).
      by_longitude(min_lng, max_lng).
      limit(API_RESULTS_LIMIT)
  end


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
