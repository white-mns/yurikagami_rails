class Item < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :kind_name,    :foreign_key => :kind,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :effect_name,  :foreign_key => :effect,  :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :ability_name, :foreign_key => :ability, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :original_price, :foreign_key => :name, :primary_key => :name, :class_name => 'MaterialPrice'
end
