class RingsController < ApplicationController
  before_action :set_ring, only: %i[show edit update destroy]

  def index
    @rings = Ring.all.order(created_at: :desc)
  end

  def new
    @ring = Ring.new
  end

  def create
    @ring = current_user.rings.build(ring_params)
    if @ring.save
      redirect_to rings_path, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @ring.update(ring_params)
      redirect_to rings_path, success: t('defaults.update_size')
    else
      flash[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  def destroy
    @ring.destroy!
    redirect_to rings_path, success: t('defaults.delete_size')
  end

  private

  def ring_params
    params.require(:ring).permit(:title, :finger_circumference)
  end

  def set_ring
    @ring = current_user.rings.find(params[:id])
  end
end
