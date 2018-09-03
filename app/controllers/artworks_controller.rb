class ArtworksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

  def index
    @artworks = policy_scope(Artwork)
  end
end
