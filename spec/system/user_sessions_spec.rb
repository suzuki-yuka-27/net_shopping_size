require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログインに成功する' do
        login_as(user)
        expect(page).to have_content 'ログインに成功しました！'
        expect(current_path).to eq root_path
      end
    end

    context 'フォームが未入力' do
      it 'ログインに失敗する' do
        visit login_path
        fill_in 'メールアドレス', with: ' '
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました。'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリックする' do
      it 'ログアウトに成功する' do
        login_as(user)
        visit root_path
        click_button 'ログアウト'
        expect(page).to have_content 'ログアウトしました！'
        expect(current_path).to eq root_path
      end
    end
  end
end