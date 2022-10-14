class BottomsController < ApplicationController
  before_action :set_bottom, only: %i[show edit update destroy]

  def index
    @bottoms = Bottom.all.order(created_at: :desc)
  end

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = current_user.bottoms.build(bottom_params)
    if @bottom.save
      redirect_to bottoms_path, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @bottom.update(bottom_params)
      redirect_to bottoms_path, success: t('defaults.update_size')
    else
      flash[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  def destroy
    @bottom.destroy!
    redirect_to bottoms_path, success: t('defaults.delete_size')
  end

  private

  def bottom_params
    params.require(:bottom).permit(:title, :waist, :hip, :rising_length, :inseam, :total_length, :thickness_of_thigh, :bottom_width)
  end

  def set_bottom
    @bottom = current_user.bottoms.find(params[:id])
  end
end
