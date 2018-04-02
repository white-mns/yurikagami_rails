class NewPlace < ApplicationRecord
	belongs_to :current_place, :foreign_key => [:place, :result_no, :generate_no], :primary_key => [:place, :result_no, :generate_no], :class_name => 'CurrentPlace'
end
