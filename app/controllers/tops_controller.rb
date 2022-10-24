class TopsController < ApplicationController
  before_action :set_top, only: %i[show edit update]

  def new
    @top = Top.new
  end

  def create
    @top = current_user.build_top(top_params)
    if @top.save
      redirect_to @top, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @top.update(top_params)
      redirect_to @top, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  private

  def top_params
    params.require(:top).permit(:neck, :shoulder_width, :body_width, :body_length, :sleeve_length, :sleeve_width)
  end

  def set_top
    @top = User.find(current_user.id).top
  end
end
