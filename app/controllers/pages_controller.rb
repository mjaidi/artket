class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :gallery_info, :contact, :comment_marche]

  def home
    @galleries = Gallery.all
    @artworks = Artwork.where(published: true)
    @artists = Artist.all
    @exhibitions = Exhibition.all
  end

  def user_gallery_dashboard
    @gallery = Gallery.where("user_id = ?", current_user.id).first

    artist_likes = ArtistLike.where(artist_id:  @gallery.artworks.map{|artwork| artwork.artist.id}).length
    gallery_likes = GalleryLike.where(gallery_id: @gallery.id).length
    artwork_likes = ArtworkLike.where(artwork_id: @gallery.artworks.ids).length
    @total_likes = artist_likes + gallery_likes + artwork_likes
  end

  def user_dashboard
    @artworks = Artwork.joins(:artwork_likes).where("user_id = ?", current_user.id)
    @galleries = Gallery.joins(:gallery_likes).where("gallery_likes.user_id = ?", current_user.id)
    @artists = Artist.joins(:artist_likes).where("artist_likes.user_id = ?", current_user.id)
  end

  def gallery_info
  end

  def contact
    @markers = {
      lat: 33.593466,
      lng: -7.642547
    }
  end

  def comment_marche
  end
end
