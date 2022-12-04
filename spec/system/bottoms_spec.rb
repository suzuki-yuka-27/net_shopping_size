require 'rails_helper'

RSpec.describe 'Bottoms', type: :system do
  let(:user) { create(:user) }
  let(:bottom) { create(:bottom) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context 'ボトムスの新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_bottom_path
          expect(current_path).to eq login_path
        end
      end

      context 'ボトムスの編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_bottom_path
          expect(current_path).to eq login_path
        end
      end

      context 'ボトムスの詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit bottom_path(bottom)
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'ボトムス新規登録' do
      context 'フォームへの入力値が正常' do
        it '新規登録が成功する' do
          visit new_bottom_path
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          fill_in '股上', with: 20.0
          fill_in '股下', with: 20.0
          fill_in '総丈', with: 20.0
          fill_in 'もも幅（わたり）', with: 20.0
          fill_in '裾幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録しました。'
          expect(current_path).to eq '/bottom.2'
        end
      end

      context 'ウエストの値が未入力' do
        it '新規登録が失敗する' do
          visit new_bottom_path
          fill_in 'ウエスト', with: ' '
          fill_in 'ヒップ', with: 20.0
          fill_in '股上', with: 20.0
          fill_in '股下', with: 20.0
          fill_in '総丈', with: 20.0
          fill_in 'もも幅（わたり）', with: 20.0
          fill_in '裾幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録できませんでした。'
          expect(current_path).to eq bottom_path
        end
      end
    end

    describe 'ボトムス編集' do
      let!(:bottom) { create(:bottom, user: user) }
      let(:other_bottom) { create(:bottom, user: user) }
      before { visit edit_bottom_path(bottom) }

      context 'フォームへの入力値が正常' do
        it 'ボトムスの編集が成功する' do
          fill_in 'ウエスト', with: 30.0
          fill_in 'ヒップ', with: 20.0
          fill_in '股上', with: 20.0
          fill_in '股下', with: 20.0
          fill_in '総丈', with: 20.0
          fill_in 'もも幅（わたり）', with: 20.0
          fill_in '裾幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新しました。'
          expect(current_path).to eq bottom_path(bottom)
        end
      end

      context '首周りの値が未入力' do
        it 'ボトムスの編集が失敗する' do
          fill_in 'ウエスト', with: ' '
          fill_in 'ヒップ', with: 20.0
          fill_in '股上', with: 20.0
          fill_in '股下', with: 20.0
          fill_in '総丈', with: 20.0
          fill_in 'もも幅（わたり）', with: 20.0
          fill_in '裾幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新できませんでした。'
          expect(current_path).to eq bottom_path
        end
      end

      context '他のユーザーのタスク編集ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_bottom) { create(:bottom, user: other_user) }

        it '編集ページへのアクセスが失敗する' do
          visit edit_bottom_path(other_bottom)
          expect(current_path).to eq edit_bottom_path(6)
        end
      end
    end
  end
end