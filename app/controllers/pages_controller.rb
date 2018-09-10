class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @galleries = Gallery.all
    @artworks = Artwork.all
    @artists = Artist.all
    @exhibitions = Exhibition.all
  end

  def user_gallery_dashboard
    @gallery = Gallery.where("user_id = ?", current_user.id).first
  end
end
