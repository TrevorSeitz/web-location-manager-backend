class PhotosController < ApplicationController

  def create
    @photo = Photo.new()
    # console.log('hello')
    byebug
  end

  # private
  #
  # def photo_params
  #   params.permit(:image)
  # end
end
