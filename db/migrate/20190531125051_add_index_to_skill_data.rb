class AddIndexToSkillData < ActiveRecord::Migration[5.2]
  def change
    add_index :skill_data, :skill_id
    add_index :skill_data, :name
    add_index :skill_data, :at
    add_index :skill_data, :ct
    add_index :skill_data, :timing_id
    add_index :skill_data, :mp
    add_index :skill_data, :target_id
    add_index :skill_data, :range
    add_index :skill_data, :property_id
    add_index :skill_data, :element_id
  end
end
