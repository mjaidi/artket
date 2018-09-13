class ArtistLikesController < ApplicationController
  def create
    @artist_like = ArtistLike.new(user_id: current_user.id, artist_id: params[:artist_id])
    authorize @artist_like
    @artist = Artist.find(params[:artist_id])
    if @artist_like.save
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @artist_like = ArtistLike.find_by("user_id = ? and artist_id = ?", current_user.id, params[:artist_id])
    authorize @artist_like
    @artist = Artist.find(params[:artist_id])
    if @artist_like.destroy
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
