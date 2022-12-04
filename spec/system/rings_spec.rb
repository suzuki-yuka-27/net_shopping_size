require 'rails_helper'

RSpec.describe 'Rings', type: :system do
  let(:user) { create(:user) }
  let(:ring) { create(:ring) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context '指輪の新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_ring_path
          expect(current_path).to eq login_path
        end
      end

      context '指輪の編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_ring_path
          expect(current_path).to eq login_path
        end
      end

      context '指輪の詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit ring_path(ring)
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe '指輪新規登録' do
      context 'フォームへの入力値が正常' do
        it '新規登録が成功する' do
          visit new_ring_path
          fill_in '指周り', with: 20.0
          click_button '作成'
          expect(page).to have_content 'サイズを記録しました。'
          expect(current_path).to eq '/ring.2'
        end
      end

      context '指周りの値が未入力' do
        it '新規登録が失敗する' do
          visit new_ring_path
          fill_in '指周り', with: ' '
          click_button '作成'
          expect(page).to have_content 'サイズを記録できませんでした。'
          expect(current_path).to eq ring_path
        end
      end
    end

    describe '指輪編集' do
      let!(:ring) { create(:ring, user: user) }
      let(:other_ring) { create(:ring, user: user) }
      before { visit edit_ring_path(ring) }

      context 'フォームへの入力値が正常' do
        it '指輪の編集が成功する' do
          fill_in '指周り', with: 30.0
          click_button '更新'
          expect(page).to have_content 'サイズを更新しました。'
          expect(current_path).to eq ring_path(ring)
        end
      end

      context '指周りの値が未入力' do
        it '指輪の編集が失敗する' do
          fill_in '指周り', with: ' '
          click_button '更新'
          expect(page).to have_content 'サイズを更新できませんでした。'
          expect(current_path).to eq ring_path
        end
      end

      context '他のユーザーのタスク編集ページにアクセス' do
        let!(:other_user) { create(:user, email: "other_user@example.com") }
        let!(:other_ring) { create(:ring, user: other_user) }

        it '編集ページへのアクセスが失敗する' do
          visit edit_ring_path(other_ring)
          expect(current_path).to eq edit_ring_path(6)
        end
      end
    end
  end
end