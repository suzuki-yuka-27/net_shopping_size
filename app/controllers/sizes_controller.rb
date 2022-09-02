class SizesController < ApplicationController
  before_action :set_size, only: %i[show edit update destroy]

  def index
    @sizes = Size.all.order(created_at: :desc)
  end

  def new
    @size = Size.new
  end

  def create
    @size = current_user.sizes.build(size_params)
    if @size.save
      redirect_to sizes_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @size.update(size_params)
      redirect_to sizes_path
    else
      render :edit
    end
  end

  def destroy
    @size.destroy!
    redirect_to sizes_path
  end

  private

  def size_params
    params.require(:size).permit(:title)
  end

  def set_size
    @size = current_user.sizes.find(params[:id])
  end
end
