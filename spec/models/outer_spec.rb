require 'rails_helper'

RSpec.describe Outer, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      outer = build(:outer)
      expect(outer).to be_valid
    end
  end

  context '首周りの値が存在しない場合' do
    it '無効であること' do
      outer = build(:outer, neck: nil)
      expect(outer).to be_invalid
      expect(outer.errors[:neck]).to include('を入力してください')
    end
  end

  context '肩幅の値が存在しない場合' do
    it '無効であること' do
      outer = build(:outer, shoulder_width: nil)
      expect(outer).to be_invalid
      expect(outer.errors[:shoulder_width]).to include('を入力してください')
    end
  end

  context '身幅（バスト）の値が存在しない場合' do
    it '無効であること' do
      outer = build(:outer, body_width: nil)
      expect(outer).to be_invalid
      expect(outer.errors[:body_width]).to include('を入力してください')
    end
  end

  context '着丈の値が存在しないこと' do
    it '無効であること' do
      outer = build(:outer, body_length: nil)
      expect(outer).to be_invalid
      expect(outer.errors[:body_length]).to include('を入力してください')
    end
  end

  context '袖丈の値が存在しない場合' do
    it '無効であること' do
      outer = build(:outer, sleeve_length: nil)
      expect(outer).to be_invalid
      expect(outer.errors[:sleeve_length]).to include('を入力してください')
    end
  end

  context '袖幅の値が存在しない場合' do
    it '無効であること' do
      outer = build(:outer, sleeve_width: nil)
      expect(outer).to be_invalid
      expect(outer.errors[:sleeve_width]).to include('を入力してください')
    end
  end
end