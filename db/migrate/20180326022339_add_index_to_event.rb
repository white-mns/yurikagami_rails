class AddIndexToEvent < ActiveRecord::Migration[5.1]
  def change
    add_index :events, [:e_no, :result_no, :sub_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :events, :event
    add_index :events, :flag
    add_index :events, :text

  end
end
