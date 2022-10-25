class OutersController < ApplicationController
  before_action :set_outer, only: %i[show edit update destroy]

  def index
    @outers = Outer.all.order(created_at: :desc)
  end

  def new
    @outer = Outer.new
  end

  def create
    @outer = current_user.outers.build(outer_params)
    if @outer.save
      redirect_to outers_path, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @outer.update(outer_params)
      redirect_to outers_path, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  def destroy
    @outer.destroy!
    redirect_to outers_path, success: t('defaults.delete_size')
  end

  private

  def outer_params
    params.require(:outer).permit(:title, :neck, :shoulder_width, :body_width, :body_length, :sleeve_length, :sleeve_width)
  end

  def set_outer
    @outer = current_user.outers.find(params[:id])
  end
end
