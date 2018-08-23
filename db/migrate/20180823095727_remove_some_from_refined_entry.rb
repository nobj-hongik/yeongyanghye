class RemoveSomeFromRefinedEntry < ActiveRecord::Migration[5.0]
  def change
    remove_column :refined_entries, :companyinfo
    remove_column :refined_entries, :howword
  end
end
