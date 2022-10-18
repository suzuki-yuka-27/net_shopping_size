class CreateHats < ActiveRecord::Migration[7.0]
  def change
    create_table :hats do |t|
      t.string :title, null: false
      t.float :head_circumference, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
