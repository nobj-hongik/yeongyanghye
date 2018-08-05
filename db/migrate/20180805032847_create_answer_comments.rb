class CreateAnswerComments < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_comments do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :answer, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
