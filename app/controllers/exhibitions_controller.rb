class ExhibitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_exhibition, only: [:show]

  def show
    @exhibition = Exhibition.find(params[:id])
    @gallery = Gallery.find(params[:id])
  end

  private

  def find_exhibition
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end
end
