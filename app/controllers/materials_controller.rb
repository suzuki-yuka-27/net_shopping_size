class MaterialsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @materials = Material.all
  end
end
