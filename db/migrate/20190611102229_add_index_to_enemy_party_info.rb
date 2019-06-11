class AddIndexToEnemyPartyInfo < ActiveRecord::Migration[5.2]
  def change
    add_index :enemy_party_infos, [:result_no, :party_no, :generate_no], :unique => false, :name => 'resultno_pno'
    add_index :enemy_party_infos, :enemy_num
  end
end
