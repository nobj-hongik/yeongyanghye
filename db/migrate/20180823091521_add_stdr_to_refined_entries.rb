class AddStdrToRefinedEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :refined_entries, :stdr_stnd, :string
  end
end
