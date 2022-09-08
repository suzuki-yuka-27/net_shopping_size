require 'rails_helper'

RSpec.describe Bottom, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      bottom = build(:bottom)
      expect(bottom).to be_valid
    end
  end

  context 'waistが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, waist: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:waist]).to include('を入力してください')
    end
  end

  context 'hipが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, hip: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:hip]).to include('を入力してください')
    end
  end

  context 'rising_lengthが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, rising_length: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:rising_length]).to include('を入力してください')
    end
  end

  context 'inseamが存在しないこと' do
    it '無効であること' do
      bottom = build(:bottom, inseam: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:inseam]).to include('を入力してください')
    end
  end

  context 'total_lengthが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, total_length: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:total_length]).to include('を入力してください')
    end
  end

  context 'thickness_of_thighが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, thickness_of_thigh: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:thickness_of_thigh]).to include('を入力してください')
    end
  end

  context 'bottom_widthが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, bottom_width: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:bottom_width]).to include('を入力してください')
    end
  end
end