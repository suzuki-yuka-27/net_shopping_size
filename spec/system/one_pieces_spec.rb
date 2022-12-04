require 'rails_helper'

RSpec.describe "OnePieces", type: :system do
  let(:user) { create(:user) }
  let(:one_piece) { create(:one_piece) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context 'ワンピースの新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_one_piece_path
          expect(current_path).to eq login_path
        end
      end

      context 'ワンピースの編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_one_piece_path
          expect(current_path).to eq login_path
        end
      end

      context 'ワンピースの詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit one_piece_path(one_piece)
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'ワンピース新規登録' do
      context 'フォームへの入力値が正常' do
        it '新規登録が成功する' do
          visit new_one_piece_path
          fill_in '首周り', with: 20.0
          fill_in '肩幅', with: 20.0
          fill_in 'バスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録しました。'
          expect(current_path).to eq '/one_piece.2'
        end
      end

      context '首周りの値が未入力' do
        it '新規登録が失敗する' do
          visit new_one_piece_path
          fill_in '首周り', with: ' '
          fill_in '肩幅', with: 20.0
          fill_in 'バスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録できませんでした。'
          expect(current_path).to eq one_piece_path
        end
      end
    end

    describe 'ワンピース編集' do
      let!(:one_piece) { create(:one_piece, user: user) }
      let(:other_one_piece) { create(:one_piece, user: user) }
      before { visit edit_one_piece_path(one_piece) }

      context 'フォームへの入力値が正常' do
        it 'ワンピースの編集が成功する' do
          fill_in '首周り', with: 30.0
          fill_in '肩幅', with: 20.0
          fill_in 'バスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新しました。'
          expect(current_path).to eq one_piece_path(one_piece)
        end
      end

      context '首周りの値が未入力' do
        it 'ワンピースの編集が失敗する' do
          fill_in '首周り', with: ' '
          fill_in '肩幅', with: 20.0
          fill_in 'バスト', with: 20.0
          fill_in 'ウエスト', with: 20.0
          fill_in 'ヒップ', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新できませんでした。'
          expect(current_path).to eq one_piece_path
        end
      end

      context '他のユーザーのタスク編集ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_one_piece) { create(:one_piece, user: other_user) }

        it '編集ページへのアクセスが失敗する' do
          visit edit_one_piece_path(other_one_piece)
          expect(current_path).to eq edit_one_piece_path(6)
        end
      end
    end
  end
end
