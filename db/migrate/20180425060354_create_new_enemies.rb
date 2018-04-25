class CreateNewEnemies < ActiveRecord::Migration[5.1]
  def change
    create_table :new_enemies do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :enemy

      t.timestamps
    end
  end
end
