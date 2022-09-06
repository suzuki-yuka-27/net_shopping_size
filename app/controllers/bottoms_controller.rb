class BottomsController < ApplicationController
  before_action :set_bottom, only: %i[show edit update]

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = current_user.build_bottom(bottom_params)
    if @bottom.save
      redirect_to @bottom
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @bottom.update(bottom_params)
      redirect_to @bottom
    else
      render :edit
    end
  end

  private

  def bottom_params
    params.require(:bottom).permit(:waist, :hip, :rising_length, :inseam, :total_length, :thickness_of_thigh, :bottom_width)
  end

  def set_bottom
    @bottom = User.find(1).bottom
  end
end
