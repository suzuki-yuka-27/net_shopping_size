class OnePiecesController < ApplicationController
  before_action :saved_one_piece, only: %i[new]
  before_action :set_one_piece, only: %i[show edit update]

  def new
    @one_piece = OnePiece.new
  end

  def create
    @one_piece = current_user.build_one_piece(one_piece_params)
    if @one_piece.save
      redirect_to @one_piece, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @one_piece.update(one_piece_params)
      redirect_to @one_piece, success: t('defaults.update_size')
    else
      flash[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  private

  def one_piece_params
    params.require(:one_piece).permit(:neck, :shoulder_width, :bust, :waist, :hip, :body_length, :sleeve_length, :sleeve_width)
  end

  def set_one_piece
    @one_piece = User.find(current_user.id).one_piece
  end

  def saved_one_piece
    @one_piece = User.find(current_user.id).one_piece
    if @one_piece
      redirect_to @one_piece
    end
  end
end