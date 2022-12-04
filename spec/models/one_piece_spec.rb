require 'rails_helper'

RSpec.describe OnePiece, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      one_piece = build(:one_piece)
      expect(one_piece).to be_valid
    end
  end

  context '首周りの値が存在しない場合' do
    it '無効であること' do
      one_piece = build(:one_piece, neck: nil)
      expect(one_piece).to be_invalid
      expect(one_piece.errors[:neck]).to include('を入力してください')
    end
  end

  context '肩幅の値が存在しない場合' do
    it '無効であること' do
      one_piece = build(:one_piece, shoulder_width: nil)
      expect(one_piece).to be_invalid
      expect(one_piece.errors[:shoulder_width]).to include('を入力してください')
    end
  end

  context 'バストの値が存在しない場合' do
    it '無効であること' do
      one_piece = build(:one_piece, bust: nil)
      expect(one_piece).to be_invalid
      expect(one_piece.errors[:bust]).to include('を入力してください')
    end
  end

  context 'ウエストの値が存在しない場合' do
    it '無効であること' do
      one_piece = build(:one_piece, waist: nil)
      expect(one_piece).to be_invalid
      expect(one_piece.errors[:waist]).to include('を入力してください')
    end
  end

  context 'ヒップの値が存在しない場合' do
    it '無効であること' do
      one_piece = build(:one_piece, hip: nil)
      expect(one_piece).to be_invalid
      expect(one_piece.errors[:hip]).to include('を入力してください')
    end
  end

  context '着丈の値が存在しないこと' do
    it '無効であること' do
      top = build(:one_piece, body_length: nil)
      expect(top).to be_invalid
      expect(top.errors[:body_length]).to include('を入力してください')
    end
  end

  context '袖丈の値が存在しない場合' do
    it '無効であること' do
      top = build(:one_piece, sleeve_length: nil)
      expect(top).to be_invalid
      expect(top.errors[:sleeve_length]).to include('を入力してください')
    end
  end

  context '袖幅の値が存在しない場合' do
    it '無効であること' do
      top = build(:one_piece, sleeve_width: nil)
      expect(top).to be_invalid
      expect(top.errors[:sleeve_width]).to include('を入力してください')
    end
  end
end
