class TopsController < ApplicationController
  before_action :set_top, only: %i[show edit update destroy]

  def index
    @tops = Top.all.order(created_at: :desc)
  end

  def new
    @top = Top.new
  end

  def create
    @top = current_user.tops.build(top_params)
    if @top.save
      redirect_to tops_path, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @top.update(top_params)
      redirect_to tops_path, success: t('defaults.update_size')
    else
      flash.now[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  def destroy
    @top.destroy!
    redirect_to tops_path, success: t('defaults.delete_size')
  end

  private

  def top_params
    params.require(:top).permit(:title, :neck, :shoulder_width, :body_width, :body_length, :sleeve_length, :sleeve_width)
  end

  def set_top
    @top = current_user.tops.find(params[:id])
  end
end
