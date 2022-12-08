class Admin::MaterialsController < Admin::BaseController
  before_action :set_material, only: %i[show edit update destroy]
  def index
    @materials = Material.all.order(created_at: :asc)
  end

  def new
    @material = Material.new
  end

  def create
    @material = current_user.materials.build(material_params)
    if @material.save
      redirect_to admin_materials_path, success: t('.success')
    else
      render :new
      flash[:danger] = t('.fail')
    end
  end

  def show; end

  def edit; end

  def update
    if @material.update(material_params)
      redirect_to admin_material_path(@material), success: t('.success')
    else
      render :edit
      flash[:danger] = t('.fail')
    end
  end

  def destroy
    @material.destroy
    redirect_to admin_materials_path
  end

  private

  def material_params
    params.require(:material).permit(:name, :description, :material_image, :material_image_cache)
  end

  def set_material
    @material = current_user.materials.find(params[:id])
  end
end
