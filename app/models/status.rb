class Status < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :tribe_name, :foreign_key => :tribe, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :job1_name, :foreign_key => :job1, :primary_key => :job_id, :class_name => 'JobName'
	belongs_to :job2_name, :foreign_key => :job2, :primary_key => :job_id, :class_name => 'JobName'
end
