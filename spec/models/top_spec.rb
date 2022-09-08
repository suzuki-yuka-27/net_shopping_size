require 'rails_helper'

RSpec.describe Top, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      top = build(:top)
      expect(top).to be_valid
    end
  end

  context 'neckが存在しない場合' do
    it '無効であること' do
      top = build(:top, neck: nil)
      expect(top).to be_invalid
      expect(top.errors[:neck]).to include('を入力してください')
    end
  end

  context 'shoulder_widthが存在しない場合' do
    it '無効であること' do
      top = build(:top, shoulder_width: nil)
      expect(top).to be_invalid
      expect(top.errors[:shoulder_width]).to include('を入力してください')
    end
  end

  context 'body_widthが存在しない場合' do
    it '無効であること' do
      top = build(:top, body_width: nil)
      expect(top).to be_invalid
      expect(top.errors[:body_width]).to include('を入力してください')
    end
  end

  context 'body_lengthが存在しないこと' do
    it '無効であること' do
      top = build(:top, body_length: nil)
      expect(top).to be_invalid
      expect(top.errors[:body_length]).to include('を入力してください')
    end
  end

  context 'sleeve_lengthが存在しない場合' do
    it '無効であること' do
      top = build(:top, sleeve_length: nil)
      expect(top).to be_invalid
      expect(top.errors[:sleeve_length]).to include('を入力してください')
    end
  end

  context 'sleeve_widthが存在しない場合' do
    it '無効であること' do
      top = build(:top, sleeve_width: nil)
      expect(top).to be_invalid
      expect(top.errors[:sleeve_width]).to include('を入力してください')
    end
  end
end