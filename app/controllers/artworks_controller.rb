class ArtworksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :find_artwork, only: [:show, :update, :destroy]

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
    @artworks = Artwork.where(["artist_id = ?", @artwork.artist_id])
    @gallery = Gallery.find(@artwork.gallery_id)
  end


  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.gallery_id = params["gallery_id"]
    
    authorize @artwork    
    if @artwork.save
      if params[:art_photos] != nil
        params[:art_photos]['photo'].each do |a|
            @photo = @artwork.art_photos.create!(photo: a)
         end
      end

      if params[:artwork]["category_ids"].length > 0
        params[:artwork]["category_ids"].each do |p|
          JoinArtCategory.create!(artwork_id: @artwork.id, category_id: p) if p != ""
        end
      end

    redirect_to user_gallery_path(current_user.id, @artwork.gallery.id)
    else
    redirect_to user_gallery_path(current_user.id, @artwork.gallery.id)
    end
  end

  def update 
    authorize @artwork   
     
    if @artwork.update (artwork_params)
      if params[:art_photos] != nil
        params[:art_photos]['photo'].each do |a|
            @photo = @artwork.art_photos.create!(photo: a)
         end
      end

      joins = JoinArtCategory.where(artwork: @artwork)
      joins.each do |j|
         j.destroy
      end


      if params[:artwork]["category_ids"].length > 0
        params[:artwork]["category_ids"].each do |p|
          JoinArtCategory.create!(artwork_id: @artwork.id, category_id: p) if p != ""
        end
      end

    redirect_to user_gallery_path(current_user.id, @artwork.gallery.id)
    else
    redirect_to user_gallery_path(current_user.id, @artwork.gallery.id)
    end
  end

  def destroy
    authorize @artwork
    @artwork.destroy
    redirect_to user_gallery_path(current_user.id, @artwork.gallery.id)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:category_ids,  :name, :description, :dimensions, :price, :artist_id, :gallery_id, :exhibition_id, :year, :photo)
  end

  def find_artwork
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end
end
