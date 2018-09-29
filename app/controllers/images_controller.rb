class ImagesController < ApplicationController

  def create
    @image = Image.new()
    # console.log('hello')
    byebug
  end

  # private
  #
  # def photo_params
  #   params.permit(:image)
  # end
end
