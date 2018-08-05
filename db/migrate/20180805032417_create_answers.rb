class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.text :content
      t.string :image
      t.integer :answer_likes_count
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :question, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
