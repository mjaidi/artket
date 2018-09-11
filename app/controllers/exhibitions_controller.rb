class ExhibitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_exhibition, only: [:show, :update]

  def index
    @exhibitions = policy_scope(Exhibition)
  end


  def show
  end

  def user_exhibitions # liste des exhibitions de l'utilisateur
    @exhibitions = Exhibition.joins(:gallery).where("user_id = ?", current_user)
    authorize @exhibitions
    @exhibition = Exhibition.new
  end

  def user_exhibition # page détail de l'exhibition de l'utilisateur
    @exhibition = Exhibition.find(params[:exhibition_id])
    authorize @exhibition
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
        
    authorize @exhibition    
    if @exhibition.save
      redirect_to user_exhibitions_path(current_user.id)
    else
      redirect_to user_exhibitions_path(current_user.id)
    end
  end

  def update 
    authorize @exhibition   

    if @exhibition.update(exhibition_params)
      redirect_to user_exhibitions_path(current_user.id)
    else
      redirect_to user_exhibitions_path(current_user.id)
    end
  end

  def add_artwork
    exhibition = Exhibition.find(params[:exhibition_id])
    authorize exhibition
    artwork = Artwork.find(params['exhibition']['artwork_ids'])
    artwork.exhibition = exhibition
    artwork.save!
    redirect_to user_exhibition_path(current_user.id,exhibition.id)
  end

   def remove_artwork
    exhibition = Exhibition.find(params[:exhibition_id])
    authorize exhibition
    artwork = Artwork.find(params[:artwork_id])
    artwork.exhibition = nil
    artwork.save!
    redirect_to user_exhibition_path(current_user.id,exhibition.id)
  end

  private

  def exhibition_params
    params.require(:exhibition).permit(:name, :gallery_id, :cover_photo, :start_date, :end_date, :description)
  end

  def find_exhibition
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end
end
