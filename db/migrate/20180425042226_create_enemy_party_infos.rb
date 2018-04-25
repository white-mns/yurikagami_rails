class CreateEnemyPartyInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :enemy_party_infos do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :party_no
      t.integer :enemy_num

      t.timestamps
    end
  end
end
