class ArtPhotosController < ApplicationController
  before_action :find_art_photo, only: [:destroy]
  
  def destroy
    authorize @art_photo
    gallery = @art_photo.artwork.gallery
    @art_photo.destroy
    redirect_to user_gallery_path(current_user.id, gallery)
  end
  
  private 
  
  def find_art_photo
    @art_photo = ArtPhoto.find(params[:id])
  end
end
