class AddIndexToSkillData < ActiveRecord::Migration[5.1]
  def change
    add_index :skill_data, :skill_id
    add_index :skill_data, :name
    add_index :skill_data, :at
    add_index :skill_data, :ct
    add_index :skill_data, :timing
    add_index :skill_data, :mp
    add_index :skill_data, :target
    add_index :skill_data, :range
    add_index :skill_data, :property
    add_index :skill_data, :element
  end
end
