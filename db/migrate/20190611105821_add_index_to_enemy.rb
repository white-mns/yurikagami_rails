class AddIndexToEnemy < ActiveRecord::Migration[5.2]
  def change
    add_index :enemies, [:result_no, :party_no, :generate_no], :unique => false, :name => 'resultno_pno'
    add_index :enemies, :enemy_id
    add_index :enemies, :suffix_id
  end
end
