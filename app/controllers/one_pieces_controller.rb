class OnePiecesController < ApplicationController
  before_action :set_one_piece, only: %i[show edit update destroy]

  def index
    @one_pieces = OnePiece.all.order(created_at: :desc)
  end

  def new
    @one_piece = OnePiece.new
  end

  def create
    @one_piece = current_user.one_pieces.build(one_piece_params)
    if @one_piece.save
      redirect_to one_pieces_path, success: t('defaults.record_size')
    else
      flash.now[:danger] = t('defaults.not_record_size')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @one_piece.update(one_piece_params)
      redirect_to one_pieces_path, success: t('defaults.update_size')
    else
      flash[:danger] = t('defaults.not_update_size')
      render :edit
    end
  end

  def destroy
    @one_piece.destroy!
    redirect_to one_pieces_path, success: t('defaults.delete_size')
  end

  private

  def one_piece_params
    params.require(:one_piece).permit(:title, :neck, :shoulder_width, :bust, :waist, :hip, :body_length, :sleeve_length, :sleeve_width)
  end

  def set_one_piece
    @one_piece = current_user.one_pieces.find(params[:id])
  end
end