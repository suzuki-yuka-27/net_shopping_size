require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  describe 'ログイン前' do
    describe 'ユーザー新規作成' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in '確認用パスワード', with: 'password'
          click_button '作成'
          expect(page).to have_content  'ユーザーを作成しました。'
          expect(current_path).to eq login_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'メールアドレス', with: ' '
          fill_in 'パスワード', with: 'password'
          fill_in '確認用パスワード', with: 'password'
          click_button '作成'
          expect(page).to have_content 'ユーザーを作成できませんでした。'
          expect(current_path).to eq users_path
        end
      end
    end
  end
end