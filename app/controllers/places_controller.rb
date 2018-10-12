class PlacesController < ApplicationController
  def index
    # byebug
    @places = Place.search(search_params.to_h.symbolize_keys)
    # places = Place.search(search_params.to_h.symbolize_keys).with_attached_image
      # byebug
    render json: @places
    # render json: places.to_json(include: { image_attachment: { include: :blob } })
    # render json: @places, include: [{document: {include: {files: {include: {attachments: {include: {blob: {methods: :service_url}}}}} }}]
  end

  def create
    @place = Place.create(place_params)
    # @otherplace = Place.create(params)
    # @place.image.attach(params[:image])
    @place.save
    # debugger
    # render json: @place
  end

  def edit
  end


  def destroy
    # debugger
    @place = Place.find(params[:id])
    @place.destroy
  end

  def update
    # debugger
    @place = Place.find(place_params[:id])
    @place.update(name: place_params[:name], venue: place_params[:venue], contactName: place_params[:contactName], contactPhone: place_params[:contactPhone], email: place_params[:email], description: place_params[:description], likes: place_params[:likes])
  end


  private

  def place_params
    params.require(:place).permit(:id, :name, :fileName, :venue, :longitude, :latitude, :contactName, :contactPhone, :email, :permit, :description, :GPSLatitudeRef, :GPSLongitudeRef, :likes, :image)
  end

  def search_params
    params.permit(:min_lng, :max_lng, :min_lat, :max_lat, :image)
  end
end

# google api key: AIzaSyCUK5vir8VCLXEU3DR_BDWU0unPxnEz7lE
