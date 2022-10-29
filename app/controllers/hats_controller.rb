class HatsController < ApplicationController
  before_action :saved_hat, only: %i[new]
  before_action :set_hat, only: %i[show edit update]

  def new
    @hat = Hat.new
  end

  def create
    @hat = current_user.build_hat(hat_params)
    if @hat.save
      redirect_to @hat, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @hat.update(hat_params)
      redirect_to @hat, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  private

  def hat_params
    params.require(:hat).permit(:head_circumference)
  end

  def set_hat
    @hat = User.find(current_user.id).hat
  end

  def saved_hat
    @hat = User.find(current_user.id).hat
    if @hat
      redirect_to @hat
    end
  end
end
