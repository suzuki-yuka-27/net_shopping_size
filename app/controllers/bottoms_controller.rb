class BottomsController < ApplicationController
  before_action :saved_bottom, only: %i[new]
  before_action :set_bottom, only: %i[show edit update]

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = current_user.build_bottom(bottom_params)
    if @bottom.save
      redirect_to @bottom, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @bottom.update(bottom_params)
      redirect_to @bottom, success: t('defaults.update_size')
    else
      flash[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  private

  def bottom_params
    params.require(:bottom).permit(:waist, :hip, :rising_length, :inseam, :total_length, :thickness_of_thigh, :bottom_width)
  end

  def set_bottom
    @bottom = User.find(current_user.id).bottom
  end

  def saved_bottom
    @bottom = User.find(current_user.id).bottom
    if @bottom
      redirect_to @bottom
    end
  end
end
