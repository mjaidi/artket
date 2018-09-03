class ArtworksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

  def index
    @artworks = policy_scope(Artwork)
    @galleries = Gallery.all

    @markers = @galleries.map do |gallery|
      {
        lat: gallery.latitude,
        lng: gallery.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end
end
