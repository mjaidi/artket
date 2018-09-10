class ArtistsController < ApplicationController

  def user_artists # list des artists de l'utilisateur
    @artists = Artist.where("user_id = ?", current_user)
    authorize @artists
  end

end
