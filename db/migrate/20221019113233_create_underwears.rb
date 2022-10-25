class CreateUnderwears < ActiveRecord::Migration[7.0]
  def change
    create_table :underwears do |t|
      t.string :title, null: false
      t.float :top_bust, null: false
      t.float :under_bust, null: false
      t.float :waist, null: false
      t.float :hip, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
