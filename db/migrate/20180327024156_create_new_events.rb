class CreateNewEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :new_events do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :event
      t.integer :flag

      t.timestamps
    end
  end
end
