class CreateNutritions < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.string :name
      t.text :brand
      t.string :character
      t.text :function
      t.text :precaution
      t.string :image
      
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
