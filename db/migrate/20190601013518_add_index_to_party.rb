class AddIndexToParty < ActiveRecord::Migration[5.2]
  def change
    add_index :parties, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_no'
    add_index :parties, :party_no
  end
end
