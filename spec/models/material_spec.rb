require 'rails_helper'

RSpec.describe Material, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      material = build(:material)
      expect(material).to be_valid
    end
  end

  context '素材名が存在しない場合' do
    it '無効であること' do
      material = build(:material, name: nil)
      expect(material).to be_invalid
      expect(material.errors[:name]).to include('を入力してください')
    end
  end

  context '説明が存在しないこと場合' do
    it '無効であること' do
      material = build(:material, description: nil)
      expect(material).to be_invalid
      expect(material.errors[:description]).to include('を入力してください')
    end
  end
end
