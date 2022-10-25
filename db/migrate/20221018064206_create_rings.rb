class CreateRings < ActiveRecord::Migration[7.0]
  def change
    create_table :rings do |t|
      t.string :title, null: false
      t.float :finger_circumference, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
