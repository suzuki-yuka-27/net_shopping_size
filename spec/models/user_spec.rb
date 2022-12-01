require 'rails_helper'

RSpec.describe User, type: :model do
  context '全て有効な場合' do
    it '有効であること' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  context 'メールアドレスが存在しない場合' do
    it '無効であること' do
      user = build(:user, email: nil)
      expect(user).to be_invalid
      expect(user.errors[:email]).to include('を入力してください')
    end
  end

  context 'パスワードが5文字以上の場合' do
    it '有効であること' do
      user = build(:user, password: 'passw', password_confirmation: 'passw')
      expect(user).to be_valid
    end
  end

  context 'パスワードが5文字未満の場合' do
    it '無効であること' do
      user = build(:user, password: 'pas', password_confirmation: 'pas')
      expect(user).to be_invalid
      expect(user.errors[:password]).to include('は5文字以上で入力してください')
    end
  end

  context '確認用パスワードが存在しない場合' do
    it '無効であること' do
      user = build(:user, password_confirmation: nil)
      expect(user).to be_invalid
      expect(user.errors[:password_confirmation]).to include('を入力してください')
    end
  end
end
