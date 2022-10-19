class CreateOuters < ActiveRecord::Migration[7.0]
  def change
    create_table :outers do |t|
      t.string :title, null: false
      t.float :neck, null:false
      t.float :shoulder_width, null: false
      t.float :body_width, null: false
      t.float :body_length, null: false
      t.float :sleeve_length, null: false
      t.float :sleeve_width, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
