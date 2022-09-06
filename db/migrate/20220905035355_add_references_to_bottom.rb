class AddReferencesToBottom < ActiveRecord::Migration[7.0]
  def change
    add_reference :bottoms, :user, null: false, foreign_key: true
  end
end
