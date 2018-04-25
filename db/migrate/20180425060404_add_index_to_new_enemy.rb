class AddIndexToNewEnemy < ActiveRecord::Migration[5.1]
  def change
    add_index :new_enemies, [:result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :new_enemies, :enemy
  end
end
