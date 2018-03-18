class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.string :nickname
      t.string :title
      t.string :job
      t.integer :tribe
      t.string :sex
      t.string :age
      t.string :height
      t.string :weight

      t.timestamps
    end
  end
end
