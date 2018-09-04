class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @galleries = Gallery.all
    @artworks = Artwork.all
    @artists = Artist.all
  end
end
