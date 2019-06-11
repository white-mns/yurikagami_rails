class CreateEnemies < ActiveRecord::Migration[5.2]
  def change
    create_table :enemies do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :enemy_id
      t.integer :suffix_id

      t.timestamps
    end
  end
end
