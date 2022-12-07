require 'rails_helper'

RSpec.describe Underwear, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      underwear = build(:underwear)
      expect(underwear).to be_valid
    end
  end

  context 'トップバストの値が存在しない場合' do
    it '無効であること' do
      underwear = build(:underwear, top_bust: nil)
      expect(underwear).to be_invalid
      expect(underwear.errors[:top_bust]).to include('を入力してください')
    end
  end

  context 'アンダーバストの値が存在しない場合' do
    it '無効であること' do
      underwear = build(:underwear, under_bust: nil)
      expect(underwear).to be_invalid
      expect(underwear.errors[:under_bust]).to include('を入力してください')
    end
  end

  context 'ウエストの値が存在しない場合' do
    it '無効であること' do
      underwear = build(:underwear, waist: nil)
      expect(underwear).to be_invalid
      expect(underwear.errors[:waist]).to include('を入力してください')
    end
  end

  context 'ヒップの値が存在しないこと' do
    it '無効であること' do
      underwear = build(:underwear, hip: nil)
      expect(underwear).to be_invalid
      expect(underwear.errors[:hip]).to include('を入力してください')
    end
  end
end