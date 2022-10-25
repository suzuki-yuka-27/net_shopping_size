class RingsController < ApplicationController
  before_action :saved_ring, only: %i[new]
  before_action :set_ring, only: %i[show edit update]

  def new
    @ring = Ring.new
  end

  def create
    @ring = current_user.build_ring(ring_params)
    if @ring.save
      redirect_to @hat, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @ring.update(ring_params)
      redirect_to @ring, success: t('defaults.update_size')
    else
      flash[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  private

  def ring_params
    params.require(:ring).permit(:finger_circumference)
  end

  def set_ring
    @ring = User.find(current_user.id).ring
  end

  def saved_ring
    @ring = User.find(current_user.id).ring
    if @ring
      redirect_to @ring
    end
  end
end
