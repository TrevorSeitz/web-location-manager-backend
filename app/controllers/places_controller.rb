class PlacesController < ApplicationController
  def index
    # byebug
    places = Place.search(search_params.to_h.symbolize_keys)
      # byebug
    render json: places

  end

  def create
    @place = Place.create(place_params)
    @place.image.attach(params[:image])
    @place.save

# @place.image.attach(io: File.open(params[:image]), filename: params[:fileName], content_type: 'image/jpeg', identify: false)
  end

  def update
    byebug
  end



  private

  def place_params
    params.require(:place).permit(:name, :fileName, :venue, :longitude, :latitude, :contactName, :contactPhone, :email, :permit, :description, :GPSLatitudeRef, :GPSLongitudeRef, :image)
  end

  def search_params
    params.permit(:min_lng, :max_lng, :min_lat, :max_lat, :image)
  end
end
