class AddIndexToEnemyPartyInfo < ActiveRecord::Migration[5.1]
  def change
    add_index :enemy_party_infos, [:party_no, :result_no, :generate_no], :unique => false, :name => 'unique_pno'
    add_index :enemy_party_infos, :enemy_num
  end
end
