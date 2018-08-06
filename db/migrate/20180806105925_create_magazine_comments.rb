class CreateMagazineComments < ActiveRecord::Migration[5.0]
  def change
    create_table :magazine_comments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :magazine, index: true, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
