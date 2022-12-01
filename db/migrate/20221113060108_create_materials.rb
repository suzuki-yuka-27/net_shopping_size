class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :material_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
