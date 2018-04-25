class CreateEnemyNames < ActiveRecord::Migration[5.1]
  def change
    create_table :enemy_names do |t|
      t.integer :enemy_id
      t.string :name

      t.timestamps
    end
  end
end
