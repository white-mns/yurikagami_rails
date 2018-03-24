class CreateSkillData < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_data do |t|
      t.integer :skill_id
      t.string :name
      t.integer :at
      t.integer :ct
      t.integer :timing
      t.integer :mp
      t.integer :target
      t.integer :range
      t.integer :property
      t.integer :element
      t.string :text

      t.timestamps
    end
  end
end
