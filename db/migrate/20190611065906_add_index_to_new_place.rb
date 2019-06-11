class AddIndexToNewPlace < ActiveRecord::Migration[5.2]
  def change
    add_index :new_places, [:result_no, :generate_no], :unique => false, :name => 'resultno_generateno'
    add_index :new_places, :place_id
  end
end
