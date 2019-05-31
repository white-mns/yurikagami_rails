class CreateSkillData < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_data do |t|
      t.integer :skill_id
      t.string :name
      t.integer :at
      t.integer :ct
      t.integer :timing_id
      t.integer :mp
      t.integer :target_id
      t.integer :range
      t.integer :property_id
      t.integer :element_id
      t.string :text

      t.timestamps
    end
  end
end
