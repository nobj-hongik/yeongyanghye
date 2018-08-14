class CreateFreelikes < ActiveRecord::Migration[5.0]
  def change
    create_table :freelikes do |t|
      t.references :free, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
