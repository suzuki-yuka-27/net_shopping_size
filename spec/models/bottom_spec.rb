require 'rails_helper'

RSpec.describe Bottom, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      bottom = build(:bottom)
      expect(bottom).to be_valid
    end
  end

  context 'ウエストが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, waist: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:waist]).to include('を入力してください')
    end
  end

  context 'ヒップが存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, hip: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:hip]).to include('を入力してください')
    end
  end

  context '股上が存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, rising_length: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:rising_length]).to include('を入力してください')
    end
  end

  context '股下が存在しないこと' do
    it '無効であること' do
      bottom = build(:bottom, inseam: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:inseam]).to include('を入力してください')
    end
  end

  context '総丈が存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, total_length: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:total_length]).to include('を入力してください')
    end
  end

  context 'もも幅（わたり）が存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, thickness_of_thigh: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:thickness_of_thigh]).to include('を入力してください')
    end
  end

  context '裾幅が存在しない場合' do
    it '無効であること' do
      bottom = build(:bottom, bottom_width: nil)
      expect(bottom).to be_invalid
      expect(bottom.errors[:bottom_width]).to include('を入力してください')
    end
  end
end