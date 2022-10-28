class UnderwearsController < ApplicationController
  before_action :set_underwear, only: %i[show edit update destroy]

  def index
    @underwears = Underwear.all.order(created_at: :desc)
  end

  def new
    @underwear = Underwear.new
  end

  def create
    @underwear = current_user.underwears.build(underwear_params)
    if @underwear.save
      redirect_to underwears_path, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @underwear.update(underwear_params)
      redirect_to underwears_path, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  def destroy
    @underwear.destroy!
    redirect_to underwears_path, success: t('defaults.delete_size')
  end

  private

  def underwear_params
    params.require(:underwear).permit(:title, :top_bust, :under_bust, :waist, :hip)
  end

  def set_underwear
    @underwear = current_user.underwears.find(params[:id])
  end
end
