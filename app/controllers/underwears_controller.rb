class UnderwearsController < ApplicationController
  before_action :saved_underwear, only: %i[new]
  before_action :set_underwear, only: %i[show edit update]

  def new
    @underwear = Underwear.new
  end

  def create
    @underwear = current_user.build_underwear(underwear_params)
    if @underwear.save
      redirect_to @underwear, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @underwear.update(underwear_params)
      redirect_to @underwear, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  private

  def underwear_params
    params.require(:underwear).permit(:top_bust, :under_bust, :waist, :hip)
  end

  def set_underwear
    @underwear = User.find(current_user.id).underwear
  end

  def saved_underwear
    @underwear = User.find(current_user.id).underwear
    if @underwear
      redirect_to @underwear
    end
  end
end
