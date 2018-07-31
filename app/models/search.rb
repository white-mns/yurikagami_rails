class Search < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Name'
	belongs_to :status,	    :foreign_key => [:e_no, :result_no, :sub_no, :generate_no], :primary_key => [:e_no, :result_no, :sub_no, :generate_no], :class_name => 'Status'
	belongs_to :item,	    :foreign_key => [:e_no, :i_no, :result_no, :main_no, :generate_no], :primary_key => [:e_no, :item_no, :result_no, :sub_no, :generate_no], :class_name => 'Item'
end
