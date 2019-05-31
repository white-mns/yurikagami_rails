class Status < ApplicationRecord
	belongs_to :pc_name, :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :job1,        :foreign_key => :job1_id,        :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :job2,        :foreign_key => :job2_id,        :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :personality, :foreign_key => :personality_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :tribe,       :foreign_key => :tribe_id,       :primary_key => :proper_id, :class_name => 'ProperName'
end
