class CreateAnswerLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_likes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :answer, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
