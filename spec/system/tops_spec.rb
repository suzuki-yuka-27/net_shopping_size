require 'rails_helper'

RSpec.describe 'Tops', type: :system do
  let(:user) { create(:user) }
  let(:top) { create(:top) }
  describe 'ログイン前' do
    describe 'ページ遷移の確認' do
      context 'トップスの新規作成ページへアクセス' do
        it '新規作成ページへのアクセスが失敗する' do
          visit new_top_path
          expect(current_path).to eq root_path
        end
      end

      context 'トップスの編集ページへアクセス' do
        it '編集ページへのアクセスが失敗する' do
          visit edit_top_path
          expect(current_path).to eq root_path
        end
      end

      context 'トップスの詳細ページへアクセス' do
        it '詳細ページへのアクセスが失敗する' do
          visit top_path(:top)
          expect(current_path).to eq root_path
        end
      end
    end
  end
end