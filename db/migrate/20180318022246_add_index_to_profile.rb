class AddIndexToProfile < ActiveRecord::Migration[5.1]
  def change
    add_index :profiles, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :profiles, :nickname
    add_index :profiles, :tribe
  end
end
