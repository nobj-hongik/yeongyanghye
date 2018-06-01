class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.text :content
      t.string :category
      t.string :image
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
