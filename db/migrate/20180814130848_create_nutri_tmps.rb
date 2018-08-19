class CreateNutriTmps < ActiveRecord::Migration[5.0]
  def change
    create_table :nutri_tmps do |t|
      t.string :howtext
      t.text :name
      t.string :function
      t.text :company
      t.text :shape
      t.text :howword
      t.text :except
      t.string :companyinfo
      t.timestamps
    end
  end
end
