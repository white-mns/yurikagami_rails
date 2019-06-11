class AddIndexToNewEvent < ActiveRecord::Migration[5.2]
  def change
    add_index :new_events, [:result_no, :generate_no], :unique => false, :name => 'resultno_generateno'
    add_index :new_events, :event_id
    add_index :new_events, :flag_id
  end
end
