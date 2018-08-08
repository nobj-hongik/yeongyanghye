class AddOwnerSelectedToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :owner_selected, :boolean
  end
end
