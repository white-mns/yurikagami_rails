class AddIndexToStatus < ActiveRecord::Migration[5.2]
  def change
    add_index :statuses, [:result_no, :e_no, :sub_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :statuses, :lv
    add_index :statuses, :exp
    add_index :statuses, :mexp
    add_index :statuses, :job1_id
    add_index :statuses, :job2_id
    add_index :statuses, :hp
    add_index :statuses, :mhp
    add_index :statuses, :hp_rate
    add_index :statuses, :mp
    add_index :statuses, :mmp
    add_index :statuses, :mp_rate
    add_index :statuses, :sp
    add_index :statuses, :str
    add_index :statuses, :int
    add_index :statuses, :tec
    add_index :statuses, :agi
    add_index :statuses, :def
    add_index :statuses, :skill
    add_index :statuses, :personality_id
    add_index :statuses, :tribe_id
    add_index :statuses, :money
    add_index :statuses, :sundries
  end
end
