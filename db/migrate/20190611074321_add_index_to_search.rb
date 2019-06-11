class AddIndexToSearch < ActiveRecord::Migration[5.2]
  def change
    add_index :searches, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :searches, [:last_result_no, :last_generate_no],       :unique => false, :name => 'last_num'
    add_index :searches, :main_no
    add_index :searches, :i_no
    add_index :searches, :i_name
    add_index :searches, :value
  end
end
