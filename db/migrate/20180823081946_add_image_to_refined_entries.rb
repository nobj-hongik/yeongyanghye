class AddImageToRefinedEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :refined_entries, :image, :string
  end
end
