class ImagesController < ApplicationController

  def create
    @image = Image.new()
    byebug
  end

  def update
    @user = User.find(params[:id])
    @user.update_attribute(image_params)
    redirect_to edit_user_path(@user)
  end

  private

  def image_params
    params.require(:user).permit(:id, :image)
  end
end
