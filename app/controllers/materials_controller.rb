class MaterialsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end
end
