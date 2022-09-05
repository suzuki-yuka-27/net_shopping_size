class TopsController < ApplicationController
  before_action :set_top, only: %i[show edit update]

  def new
    @top = Top.new
  end

  def create
    @top = current_user.tops.build(top_params)
    if @top.save
      redirect_to sizes_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @top.update(top_params)
      redirect_to @top
    else
      render :edit
    end
  end

  private

  def top_params
    params.require(:top).permit(:neck, :shoulder_width, :body_width, :body_length, :sleeve_length, :sleeve_width)
  end

  def set_top
    @top = current_user.sizes.find(params[:id)
  end
end
