class AddIndexToEventProceed < ActiveRecord::Migration[5.2]
  def change
    add_index :event_proceeds, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :event_proceeds, :event_id
    add_index :event_proceeds, :last_flag_id
    add_index :event_proceeds, :flag_id
  end
end
