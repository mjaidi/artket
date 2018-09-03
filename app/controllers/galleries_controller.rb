class GalleriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_gallery, only: [:show]

  def show
  end

  private

  def find_gallery
    @gallery = Gallery.find(params[:id])
    authorize @gallery
  end
end
