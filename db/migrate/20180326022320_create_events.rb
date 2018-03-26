class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :event
      t.integer :flag
      t.integer :text

      t.timestamps
    end
  end
end
