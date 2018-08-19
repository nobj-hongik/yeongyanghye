class AddIsSelectedToMagazines < ActiveRecord::Migration[5.0]
  def change
    add_column :magazines, :is_selected, :boolean
  end
end
