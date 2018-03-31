class AddIndexToPartyInfo < ActiveRecord::Migration[5.1]
  def change
    add_index :party_infos, [:party_no, :result_no, :generate_no], :unique => false, :name => 'unique_pno'
    add_index :party_infos, :name
    add_index :party_infos, :member_num
    add_index :party_infos, :battler_num
    add_index :party_infos, :sook_num
  end
end
