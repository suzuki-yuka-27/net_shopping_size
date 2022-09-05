class CreateTops < ActiveRecord::Migration[7.0]
  def change
    create_table :tops do |t|
      t.float :neck, null:false
      t.float :shoulder_width, null: false
      t.float :body_width, null: false
      t.float :body_length, null: false
      t.float :sleeve_length, null: false
      t.float :sleeve_width, null: false

      t.timestamps
    end
  end
end
