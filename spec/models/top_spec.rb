require 'rails_helper'

RSpec.describe Top, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      top = build(:top)
      expect(top).to be_valid
    end
  end

  context '首周りの値が存在しない場合' do
    it '無効であること' do
      top = build(:top, neck: nil)
      expect(top).to be_invalid
      expect(top.errors[:neck]).to include('を入力してください')
    end
  end

  context '肩幅の値が存在しない場合' do
    it '無効であること' do
      top = build(:top, shoulder_width: nil)
      expect(top).to be_invalid
      expect(top.errors[:shoulder_width]).to include('を入力してください')
    end
  end

  context '身幅（バスト）の値が存在しない場合' do
    it '無効であること' do
      top = build(:top, body_width: nil)
      expect(top).to be_invalid
      expect(top.errors[:body_width]).to include('を入力してください')
    end
  end

  context '着丈の値が存在しないこと' do
    it '無効であること' do
      top = build(:top, body_length: nil)
      expect(top).to be_invalid
      expect(top.errors[:body_length]).to include('を入力してください')
    end
  end

  context '袖丈の値が存在しない場合' do
    it '無効であること' do
      top = build(:top, sleeve_length: nil)
      expect(top).to be_invalid
      expect(top.errors[:sleeve_length]).to include('を入力してください')
    end
  end

  context '袖幅の値が存在しない場合' do
    it '無効であること' do
      top = build(:top, sleeve_width: nil)
      expect(top).to be_invalid
      expect(top.errors[:sleeve_width]).to include('を入力してください')
    end
  end
end