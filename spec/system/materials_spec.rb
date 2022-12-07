require 'rails_helper'

RSpec.describe "Materials", type: :system do
  let(:material) { create(:material)}
  describe 'ページ遷移の確認' do
    context '素材一覧ページへのアクセス' do
      it '素材一覧ページへのアクセスが成功する' do
        visit materials_path
        expect(current_path).to eq materials_path
      end
    end
  end
end
