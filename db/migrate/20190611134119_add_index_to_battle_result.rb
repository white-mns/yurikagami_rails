class AddIndexToBattleResult < ActiveRecord::Migration[5.2]
  def change
    add_index :battle_results, [:result_no, :party_no, :generate_no], :unique => false, :name => 'resultno_pno'
    add_index :battle_results, :battle_result
    add_index :battle_results, :is_pk
  end
end
