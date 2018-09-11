class ArtistsController < ApplicationController
  before_action :find_artist, only: [ :update]

  def user_artists # list des artists de l'utilisateur
    @artists = Artist.where("user_id = ?", current_user)
    authorize @artists
    @artist = Artist.new
  end

 def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    authorize @artist    
    if @artist.save
      redirect_to user_artists_path(current_user.id)
    else
      redirect_to user_artists_path(current_user.id)
    end
  end

  def update 
    authorize @artist   

    if @artist.update
      redirect_to user_artists_path(current_user.id)
    else
      redirect_to user_artists_path(current_user.id)
    end
  end

  private 

  def artist_params
    params.require(:artist).permit(:first_name, :last_name, :photo, :birth_date, :death_date, :description)
  end

  def find_artist
    @artist = Artist.find(params[:id])
    authorize @artist
  end

end
