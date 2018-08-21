class AddMfdsToNutritions < ActiveRecord::Migration[5.0]
  def change
    add_column :nutritions, :mfds, :string
  end
end
