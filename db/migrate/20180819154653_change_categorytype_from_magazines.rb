class ChangeCategorytypeFromMagazines < ActiveRecord::Migration[5.0]
  def change
    change_column :magazines, :category, :integer
  end
end
