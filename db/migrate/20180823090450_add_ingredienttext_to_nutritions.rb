class AddIngredienttextToNutritions < ActiveRecord::Migration[5.0]
  def change
    add_column :nutritions, :ingredienttext, :text
  end
end
