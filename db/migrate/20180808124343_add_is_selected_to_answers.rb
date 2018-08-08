class AddIsSelectedToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :is_selected, :boolean
  end
end
