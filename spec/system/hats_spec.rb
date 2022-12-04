require 'rails_helper'

RSpec.describe 'Hats', type: :system do
  let(:user) { create(:user) }
  let(:hat) { create(:hat) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context '帽子の新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_hat_path
          expect(current_path).to eq login_path
        end
      end

      context '帽子の編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_hat_path
          expect(current_path).to eq login_path
        end
      end

      context '帽子の詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit hat_path(hat)
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe '帽子新規登録' do
      context 'フォームへの入力値が正常' do
        it '新規登録が成功する' do
          visit new_hat_path
          fill_in '頭周り', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録しました。'
          expect(current_path).to eq '/hat.2'
        end
      end

      context '頭周りの値が未入力' do
        it '新規登録が失敗する' do
          visit new_hat_path
          fill_in '頭周り', with: ' '
          click_button '作成'
          expect(page).to have_content 'サイズを記録できませんでした。'
          expect(current_path).to eq hat_path
        end
      end
    end

    describe '帽子編集' do
      let!(:hat) { create(:hat, user: user) }
      let(:other_hat) { create(:hat, user: user) }
      before { visit edit_hat_path(hat) }

      context 'フォームへの入力値が正常' do
        it '帽子の編集が成功する' do
          fill_in '頭周り', with: 30.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新しました。'
          expect(current_path).to eq hat_path(hat)
        end
      end

      context '頭周りの値が未入力' do
        it '帽子の編集が失敗する' do
          fill_in '頭周り', with: ' '
          click_button '更新'
          expect(page).to have_content 'サイズを更新できませんでした。'
          expect(current_path).to eq hat_path
        end
      end

      context '他のユーザーのタスク編集ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_hat) { create(:hat, user: other_user) }

        it '編集ページへのアクセスが失敗する' do
          visit edit_hat_path(other_hat)
          expect(current_path).to eq edit_hat_path(6)
        end
      end
    end
  end
end