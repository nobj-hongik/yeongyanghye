class AddStdrToNutriTmps < ActiveRecord::Migration[5.0]
  def change
    add_column :nutri_tmps, :stdr_stnd, :string
  end
end
