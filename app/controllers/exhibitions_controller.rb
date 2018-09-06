class ExhibitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_exhibition, only: [:show]

  def index
    @exhibitions = policy_scope(Exhibition)
  end


  def show
  end

  private

  def find_exhibition
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end
end
