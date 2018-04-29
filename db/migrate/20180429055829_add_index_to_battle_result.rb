class AddIndexToBattleResult < ActiveRecord::Migration[5.1]
  def change
    add_index :battle_results, [:party_no, :result_no, :generate_no], :unique => false, :name => 'unique_pno'
    add_index :battle_results, :battle_result
  end
end
