class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :event_id
      t.integer :flag_id
      t.integer :text_id

      t.timestamps
    end
  end
end
