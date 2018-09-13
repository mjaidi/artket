class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @galleries = Gallery.all
    @artworks = Artwork.where(published: true)
    @artists = Artist.all
    @exhibitions = Exhibition.all
    # Home banner gallery
    @gallery = Gallery.find(22)
  end

  def user_gallery_dashboard
    @gallery = Gallery.where("user_id = ?", current_user.id).first
  end

  def user_dashboard
    @artworks = Artwork.joins(:artwork_likes).where("user_id = ?", current_user.id)
    @galleries = Gallery.joins(:gallery_likes).where("gallery_likes.user_id = ?", current_user.id)
  end
end
