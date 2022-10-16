class HatsController < ApplicationController
  before_action :set_hat, only: %i[show edit update destroy]

  def index
    @hats = Hat.all.order(created_at: :desc)
  end

  def new
    @hat = Hat.new
  end

  def create
    @hat = current_user.hats.build(hat_params)
    if @hat.save
      redirect_to hats_path, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @hat.update(hat_params)
      redirect_to hats_path, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  def destroy
    @hat.destroy!
    redirect_to hats_path, success: t('defaults.delete_size')
  end

  private

  def hat_params
    params.require(:hat).permit(:title, :head_circumference)
  end

  def set_hat
    @hat = current_user.hats.find(params[:id])
  end

end
