class CreateNewEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :new_events do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :event_id
      t.integer :flag_id

      t.timestamps
    end
  end
end
