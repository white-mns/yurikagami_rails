class AddIndexToName < ActiveRecord::Migration[5.1]
  def change
    add_index :names, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :names, :name
  end
end
