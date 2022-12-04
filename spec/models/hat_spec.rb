require 'rails_helper'

RSpec.describe Hat, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      hat = build(:hat)
      expect(hat).to be_valid
    end
  end

  context '頭周りの値が存在しない場合' do
    it '無効であること' do
      hat = build(:hat, head_circumference: nil)
      expect(hat).to be_invalid
      expect(hat.errors[:head_circumference]).to include('を入力してください')
    end
  end
end