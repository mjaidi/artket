class GalleryLikesController < ApplicationController
  def create
    @gallery_like = GalleryLike.new(user_id: current_user.id, gallery_id: params[:gallery_id])
    authorize @gallery_like
    @gallery = Gallery.find(params[:gallery_id])
    if @gallery_like.save
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @gallery_like = GalleryLike.find_by("user_id = ? and gallery_id = ?", current_user.id, params[:gallery_id])
    authorize @gallery_like
    @gallery = Gallery.find(params[:gallery_id])
    if @gallery_like.destroy
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
