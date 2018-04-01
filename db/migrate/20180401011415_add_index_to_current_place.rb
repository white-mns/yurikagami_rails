class AddIndexToCurrentPlace < ActiveRecord::Migration[5.1]
  def change
    add_index :current_places, [:party_no, :result_no, :generate_no], :unique => false, :name => 'unique_pno'
    add_index :current_places, :place
    add_index :current_places, :shop
    add_index :current_places, :inn
  end
end
