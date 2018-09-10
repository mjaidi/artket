class ExhibitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_exhibition, only: [:show]

  def index
    @exhibitions = policy_scope(Exhibition)
  end


  def show
  end

  def user_exhibitions # liste des exhibitions de l'utilisateur
    @exhibitions = Exhibition.joins(:gallery).where("user_id = ?", current_user)
    authorize @exhibitions
  end

  def user_exhibition # page détail de l'exhibition de l'utilisateur
    @exhibition = Exhibition.find(params[:exhibition_id])
    authorize @exhibition
  end

  private

  def find_exhibition
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end
end
