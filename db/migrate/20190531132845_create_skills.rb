class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :skill_no
      t.integer :skill_id

      t.timestamps
    end
  end
end
