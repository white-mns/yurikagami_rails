class AddIndexToEventProceed < ActiveRecord::Migration[5.1]
  def change
    add_index :event_proceeds, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :event_proceeds, :event
    add_index :event_proceeds, :last_flag
    add_index :event_proceeds, :flag
  end
end
