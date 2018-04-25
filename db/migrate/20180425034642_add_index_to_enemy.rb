class AddIndexToEnemy < ActiveRecord::Migration[5.1]
  def change
    add_index :enemies, [:party_no, :result_no, :generate_no], :unique => false, :name => 'unique_pno'
    add_index :enemies, :enemy
  end
end
