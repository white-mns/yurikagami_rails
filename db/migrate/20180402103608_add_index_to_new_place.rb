class AddIndexToNewPlace < ActiveRecord::Migration[5.1]
  def change
    add_index :new_places, [:result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :new_places, :place
  end
end
