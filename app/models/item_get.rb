class ItemGet < ApplicationRecord
	belongs_to :pc_name, :foreign_key => [:result_no, :e_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :enemy, :foreign_key => :enemy_id, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :item,  :foreign_key => :item_id,  :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :current_place, :foreign_key => [:result_no, :party_no, :generate_no], :primary_key => [:result_no, :party_no, :generate_no], :class_name => 'CurrentPlace'
	belongs_to :item_data,  :foreign_key => [:result_no, :e_no, :i_no, :sub_no, :generate_no], :primary_key => [:result_no, :e_no, :item_no, :sub_no, :generate_no], :class_name => 'Item'
end
