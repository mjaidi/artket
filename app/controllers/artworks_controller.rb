class ArtworksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :find_artwork, only: [:show]

  def index
    @artworks = policy_scope(Artwork)

    if params[:query].present?
      @artworks = Artwork.search("%#{params[:query]}%", hitsPerPage: 4)
      @markers = @artworks.map do |gallery|
        {
          lat: gallery.gallery.latitude,
          lng: gallery.gallery.longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    else
      @artworks = Artwork.all
      @markers = @artworks.map do |gallery|
        {
          lat: gallery.gallery.latitude,
          lng: gallery.gallery.longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end
  end

  def show
  end

  private

  def find_artwork
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end
end
