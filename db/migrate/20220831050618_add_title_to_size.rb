class AddTitleToSize < ActiveRecord::Migration[7.0]
  def change
    add_column :sizes, :title, :string, null: false
  end
end
