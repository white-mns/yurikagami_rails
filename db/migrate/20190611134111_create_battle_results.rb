class CreateBattleResults < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_results do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :battle_result
      t.integer :is_pk

      t.timestamps
    end
  end
end
