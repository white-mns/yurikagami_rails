class AddIndexToNewEvent < ActiveRecord::Migration[5.1]
  def change
    add_index :new_events, [:result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :new_events, :event
    add_index :new_events, :flag
  end
end
