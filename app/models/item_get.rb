class ItemGet < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :enemy_name, :foreign_key => :enemy,    :primary_key => :enemy_id, :class_name => 'EnemyName'
	belongs_to :current_place, :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'CurrentPlace'
	belongs_to :item_data,  :foreign_key => [:e_no, :i_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
end
