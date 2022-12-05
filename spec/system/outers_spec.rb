require 'rails_helper'

RSpec.describe 'Outers', type: :system do
  let(:user) { create(:user) }
  let(:outer) { create(:outer) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context 'アウターの新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_outer_path
          expect(current_path).to eq login_path
        end
      end

      context 'アウターの編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_outer_path
          expect(current_path).to eq login_path
        end
      end

      context 'アウターの詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit outer_path(outer)
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'アウター新規登録' do
      context 'フォームへの入力値が正常' do
        it '新規登録が成功する' do
          visit new_outer_path
          fill_in '首周り', with: 20.0
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録しました。'
          expect(current_path).to eq '/outer.2'
        end
      end

      context '首周りの値が未入力' do
        it '新規登録が失敗する' do
          visit new_outer_path
          fill_in '首周り', with: ' '
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録できませんでした。'
          expect(current_path).to eq outer_path
        end
      end
    end

    describe 'アウター編集' do
      let!(:outer) { create(:outer, user: user) }
      let(:other_outer) { create(:outer, user: user) }
      before { visit edit_outer_path(outer) }

      context 'フォームへの入力値が正常' do
        it 'アウターの編集が成功する' do
          fill_in '首周り', with: 30.0
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新しました。'
          expect(current_path).to eq outer_path(outer)
        end
      end

      context '首周りの値が未入力' do
        it 'アウターの編集が失敗する' do
          fill_in '首周り', with: ' '
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新できませんでした。'
          expect(current_path).to eq outer_path
        end
      end

      context '他のユーザーのタスク編集ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_outer) { create(:outer, user: other_user) }

        it '編集ページへのアクセスが失敗する' do
          visit edit_outer_path(other_outer)
          expect(current_path).to eq edit_outer_path(6)
        end
      end
    end
  end
end