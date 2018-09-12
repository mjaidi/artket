class ArtworkLikesController < ApplicationController
  def create
    @artwork_like = ArtworkLike.new(user_id: current_user.id, artwork_id: params[:artwork_id])
    authorize @artwork_like
    @artwork = Artwork.find(params[:artwork_id])
    if @artwork_like.save
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @artwork_like = ArtworkLike.find_by("user_id = ? and artwork_id = ?", current_user.id, params[:artwork_id])
    authorize @artwork_like
    @artwork = Artwork.find(params[:artwork_id])
    if @artwork_like.destroy
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
