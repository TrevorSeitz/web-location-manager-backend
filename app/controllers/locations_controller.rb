class LocationsController < ApplicationController
  def index
    locations = Location.search(search_params.to_h.symbolize_keys)
    render json: locations
  end
 
  private
 
  def search_params
    params.permit(:min_lng, :max_lng, :min_lat, :max_lat)
  end
end