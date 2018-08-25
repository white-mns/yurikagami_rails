class AddIndexToSmithDisplay < ActiveRecord::Migration[5.1]
  def change
    add_index :smith_displays, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :smith_displays, :party_no
    add_index :smith_displays, :total_price
    add_index :smith_displays, :price_rate
    add_index :smith_displays, :display_rate
  end
end
