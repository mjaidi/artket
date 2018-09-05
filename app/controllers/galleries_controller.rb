class GalleriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_gallery, only: [:show]

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

  private

  def find_gallery
    @gallery = Gallery.find(params[:id])
    authorize @gallery
  end
end
