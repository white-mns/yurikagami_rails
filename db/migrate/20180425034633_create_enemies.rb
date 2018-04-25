class CreateEnemies < ActiveRecord::Migration[5.1]
  def change
    create_table :enemies do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :enemy
      t.string :suffix

      t.timestamps
    end
  end
end
