class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :sub_no
      t.integer :lv
      t.integer :exp
      t.integer :mexp
      t.integer :job1
      t.integer :job2
      t.integer :hp
      t.integer :mhp
      t.float :hp_rate
      t.integer :mp
      t.integer :mmp
      t.float :mp_rate
      t.integer :sp
      t.integer :str
      t.integer :int
      t.integer :tec
      t.integer :agi
      t.integer :def
      t.integer :skill
      t.integer :personality
      t.integer :tribe
      t.integer :money
      t.integer :sundries

      t.timestamps
    end
  end
end
