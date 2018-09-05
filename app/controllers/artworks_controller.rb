class ArtworksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :find_artwork, only: [:show]

  def index
    @artworks = policy_scope(Artwork)

    if params[:query].present?
      @artworks = Artwork.global_search("%#{params[:query]}%")
      @galleries = @artworks.map {|artwork| artwork.gallery}
      @markers = @galleries.uniq.map do |gallery|
        {
          lat: gallery.latitude,
          lng: gallery.longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    else
      @artworks = Artwork.all
      @galleries = @artworks.map {|artwork| artwork.gallery}
      @markers = @galleries.uniq.map do |gallery|
        {
          lat: gallery.latitude,
          lng: gallery.longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end

    @artists = @artworks.map {|artwork| artwork.artist}
    @categories = Category.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  private

  def find_artwork
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end
end
