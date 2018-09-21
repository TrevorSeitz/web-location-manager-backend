class PlacesController < ApplicationController
  def index
    places = Place.search(search_params.to_h.symbolize_keys)
    render json: places
  end

  def create

  byebug
    @place = Place.new(place_params)
    @place.save
  end


  private

  def place_params
    params.permit(:name, :venue, :longitude, :latitude, :contactName, :contactPhone, :email, :description, :fileName, :GPSLatitudeRef, :GPSLongitudeRef)
  end

  def search_params
    params.permit(:min_lng, :max_lng, :min_lat, :max_lat)
  end
end
