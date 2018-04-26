class ItemGet < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :enemy_name, :foreign_key => :enemy,    :primary_key => :enemy_id, :class_name => 'EnemyName'
end
