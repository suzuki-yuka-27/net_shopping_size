require 'rails_helper'

RSpec.describe 'Tops', type: :system do
  let(:user) { create(:user) }
  let(:top) { create(:top) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context 'トップスの新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_top_path
          expect(current_path).to eq login_path
        end
      end

      context 'トップスの編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_top_path
          expect(current_path).to eq login_path
        end
      end

      context 'トップスの詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit top_path(top)
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'トップス新規登録' do
      context 'フォームへの入力値が正常' do
        it '新規登録が成功する' do
          visit new_top_path
          fill_in '首周り', with: 20.0
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録しました。'
          expect(current_path).to eq '/top.2'
        end
      end

      context '首周りの値が未入力' do
        it '新規登録が失敗する' do
          visit new_top_path
          fill_in '首周り', with: ' '
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録できませんでした。'
          expect(current_path).to eq top_path
        end
      end
    end

    describe 'トップス編集' do
      let!(:top) { create(:top, user: user) }
      let(:other_top) { create(:top, user: user) }
      before { visit edit_top_path(top) }

      context 'フォームへの入力値が正常' do
        it 'トップスの編集が成功する' do
          fill_in '首周り', with: 30.0
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新しました。'
          expect(current_path).to eq top_path(top)
        end
      end

      context '首周りの値が未入力' do
        it 'トップスの編集が失敗する' do
          fill_in '首周り', with: ' '
          fill_in '肩幅', with: 20.0
          fill_in '身幅（バスト）', with: 20.0
          fill_in '着丈', with: 20.0
          fill_in '袖丈', with: 20.0
          fill_in '袖幅', with: 20.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新できませんでした。'
          expect(current_path).to eq top_path
        end
      end

      context '他のユーザーのタスク編集ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_top) { create(:top, user: other_user) }

        it '編集ページへのアクセスが失敗する' do
          visit edit_top_path(other_top)
          expect(current_path).to eq edit_top_path(6)
        end
      end
    end
  end
end