class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :category
      t.string :title
      t.text :content
      t.string :image
      t.integer :question_likes_count
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
