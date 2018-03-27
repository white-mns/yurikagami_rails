class CreateEventProceeds < ActiveRecord::Migration[5.1]
  def change
    create_table :event_proceeds do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :event
      t.integer :last_flag
      t.integer :flag

      t.timestamps
    end
  end
end
