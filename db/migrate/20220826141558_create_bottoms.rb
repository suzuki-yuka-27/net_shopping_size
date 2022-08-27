class CreateBottoms < ActiveRecord::Migration[7.0]
  def change
    create_table :bottoms do |t|
      t.references :size, null: false, foreign_key: true
      t.float :waist, null: false
      t.float :hip, null: false
      t.float :rising_length, null: false
      t.float :inseam, null: false
      t.float :total_length, null: false
      t.float :thickness_of_thigh, null: false
      t.float :bottom_width, null: false

      t.timestamps
    end
  end
end
