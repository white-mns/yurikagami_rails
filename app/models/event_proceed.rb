class EventProceed < ApplicationRecord
	belongs_to :p_name,	        :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :event_name,     :foreign_key => :event,     :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :last_flag_name, :foreign_key => :last_flag, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :flag_name,      :foreign_key => :flag,      :primary_key => :proper_id, :class_name => 'ProperName'
end
