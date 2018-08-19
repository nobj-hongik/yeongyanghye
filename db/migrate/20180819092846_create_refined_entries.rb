class CreateRefinedEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :refined_entries do |t|
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
