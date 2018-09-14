class GalleriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_gallery, only: [:show, :contact, :update]

  def index
    @galleries = policy_scope(Gallery)
    @markers = @galleries.map do |gallery|
      {
        lat: gallery.latitude,
        lng: gallery.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
  end

  def contact
    @markers = {
      lat: @gallery.latitude,
      lng: @gallery.longitude
    }

  end

  def user_gallery
    @artwork = Artwork.new
    @gallery = Gallery.find(params[:gallery_id])
    authorize @gallery
  end

  def update
    authorize @gallery

    if @gallery.update(gallery_params)
      redirect_to user_gallery_dashboard_path(current_user.id)
    else
      redirect_to user_gallery_dashboard_path(current_user.id)
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :photo, :address_line, :city, :country, :description, :phone, :email)
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
    authorize @gallery
  end
end
