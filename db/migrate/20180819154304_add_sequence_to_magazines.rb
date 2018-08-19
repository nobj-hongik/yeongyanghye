class AddSequenceToMagazines < ActiveRecord::Migration[5.0]
  def change
    add_column :magazines, :sequence, :integer
  end
end
