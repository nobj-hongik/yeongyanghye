class CreateNutritions < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.string :name    
      t.text :company   
      t.string :shape   
      t.text :function    
      t.text :except    
      t.string :image   
      t.text :howtext   
      t.text :howword   
      t.string :companyinfo 
      t.string :certifi   
      t.string :contury   
      t.string :price   
      t.integer :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
