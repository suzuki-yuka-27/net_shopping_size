class OutersController < ApplicationController
  before_action :set_outer, only: %i[show edit update]

  def new
    @outer = Outer.new
  end

  def create
    @outer = current_user.build_outer(outer_params)
    if @outer.save
      redirect_to @outer, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @outer.update(outer_params)
      redirect_to @outer, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  private

  def outer_params
    params.require(:outer).permit(:neck, :shoulder_width, :body_width, :body_length, :sleeve_length, :sleeve_width)
  end

  def set_outer
    @outer = User.find(current_user.id).outer
  end
end
