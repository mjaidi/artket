class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @galleries = Gallery.all
    @artworks = Artwork.all
    @artists = Artist.all
    @exhibitions = Exhibition.all
  end

  def user_gallery_dashboard
  end
end
