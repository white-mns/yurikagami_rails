class AddIndexToCurrentPlace < ActiveRecord::Migration[5.2]
  def change
    add_index :current_places, [:result_no, :party_no, :generate_no], :unique => false, :name => 'resultno_pno'
    add_index :current_places, :place_id
    add_index :current_places, :shop
    add_index :current_places, :inn
  end
end
