class AddReferencesToTop < ActiveRecord::Migration[7.0]
  def change
    add_reference :tops, :user, null: false, foreign_key: true
  end
end