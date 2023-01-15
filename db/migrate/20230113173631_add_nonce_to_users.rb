class AddNonceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nonce, :string, null: false, default: 0
  end
end
