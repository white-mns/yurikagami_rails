class AddIndexToEnemyName < ActiveRecord::Migration[5.1]
  def change
    add_index :enemy_names, :enemy_id
    add_index :enemy_names, :name
  end
end
