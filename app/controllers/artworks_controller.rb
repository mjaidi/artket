require 'will_paginate/array'
class ArtworksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show, :get_subcategories]
    before_action :find_artwork, only: [:show, :update, :destroy]

  def index
    @artworks = policy_scope(Artwork).where(published: true)

    if params[:query].present?
      @artworks = Artwork.where(published: true).global_search("%#{params[:query]}%")
    else
      @artworks = @artworks
    end

    if (params["city"] == nil || params["city"] == "")  && (params["category"] == nil || params["category"] == "" ) && (params["subcategory"] == nil || params["subcategory"] == "")
      @artworks
    elsif (params["city"] == nil || params["city"] == "") && (params["subcategory"] == nil || params["subcategory"] == "")
      @artworks = @artworks.select {|artwork| artwork.categories.ids.any?  { |i| Category.where(parent_id: params["category"]).map {|cat| cat.id}.include? i }  }  
    elsif (params["category"] == nil || params["category"] == "" )
      @artworks = @artworks.select { |artwork| artwork.gallery.city == params["city"]} 
    elsif (params["subcategory"] == nil || params["subcategory"] == "")
      @artworks = @artworks.select { |artwork| artwork.categories.ids.any?  { |i| Category.where(parent_id: params["category"]).map {|cat| cat.id}.include? i } }.select { |artwork| artwork.gallery.city == params["city"]} 
    elsif (params["city"] == nil || params["city"] == "")
      @artworks = @artworks.select { |artwork| artwork.categories.ids.include? params["subcategory"].to_i} 
    else 
      @artworks = @artworks.select { |artwork| artwork.categories.ids.include? params["subcategory"].to_i}.select { |artwork| artwork.gallery.city == params["city"]} 
    end 

    @artists = @artworks.map {|artwork| artwork.artist}.paginate(:page => params[:page], :per_page => 9)
    @galleries = @artworks.map {|artwork| artwork.gallery}.paginate(:page => params[:page], :per_page => 9)
    @artworks = @artworks.paginate(:page => params[:page], :per_page => 9)
    @categories = Category.all
    @selected_category = 0
      @markers = @galleries.uniq.map do |gallery|
        { lat: gallery.latitude, lng: gallery.longitude }
    end

    respond_to do |format|
      format.html
      format.json { render json: @artworks }
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

    if @artwork.update(artwork_params)

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

  def like
  end

  def get_subcategories
    @selected_category =  params[:category_id]
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
