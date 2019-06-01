class AddIndexToPartyInfo < ActiveRecord::Migration[5.2]
  def change
    add_index :party_infos, [:result_no, :party_no, :generate_no], :unique => false, :name => 'resultno_pno'
    add_index :party_infos, :name
    add_index :party_infos, :member_num
    add_index :party_infos, :battler_num
  end
end
