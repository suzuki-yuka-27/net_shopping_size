class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :question, null: false
      t.string :question_image
      t.string :choice_1, null: false
      t.string :choice_2, null: false
      t.string :choice_3, null: false
      t.string :choice_4, null: false
      t.string :answer, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
