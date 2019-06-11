class AddIndexToEvent < ActiveRecord::Migration[5.2]
  def change
    add_index :events, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :events, :event_id
    add_index :events, :flag_id
    add_index :events, :text_id
  end
end
