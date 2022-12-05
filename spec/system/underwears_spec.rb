require 'rails_helper'

RSpec.describe 'Underwears', type: :system do
  let(:user) { create(:user) }
  let(:underwear) { create(:underwear) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context '下着の新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_underwear_path
          expect(current_path).to eq login_path
        end
      end

      context '下着の編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_underwear_path
          expect(current_path).to eq login_path
        end
      end

      context '下着の詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit underwear_path(underwear)
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe '下着新規登録' do
      context 'フォームへの入力値が正常' do
        it '新規登録が成功する' do
          visit new_underwear_path
          fill_in 'トップバスト', with: 20.0
          fill_in 'アンダーバスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録しました。'
          expect(current_path).to eq '/underwear.2'
        end
      end

      context '首周りの値が未入力' do
        it '新規登録が失敗する' do
          visit new_underwear_path
          fill_in 'トップバスト', with: ' '
          fill_in 'アンダーバスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録できませんでした。'
          expect(current_path).to eq underwear_path
        end
      end
    end

    describe '下着編集' do
      let!(:underwear) { create(:underwear, user: user) }
      let(:other_underwear) { create(:underwear, user: user) }
      before { visit edit_underwear_path(underwear) }

      context 'フォームへの入力値が正常' do
        it '下着の編集が成功する' do
          fill_in 'トップバスト', with: 30.0
          fill_in 'アンダーバスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新しました。'
          expect(current_path).to eq underwear_path(underwear)
        end
      end

      context '首周りの値が未入力' do
        it '下着の編集が失敗する' do
          fill_in 'トップバスト', with: ' '
          fill_in 'アンダーバスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新できませんでした。'
          expect(current_path).to eq underwear_path
        end
      end

      context '他のユーザーのタスク編集ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_underwear) { create(:underwear, user: other_user) }

        it '編集ページへのアクセスが失敗する' do
          visit edit_underwear_path(other_underwear)
          expect(current_path).to eq edit_underwear_path(6)
        end
      end
    end
  end
end