class RemoveColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name, :string
    remove_column :users, :jender, :string
  end
end
