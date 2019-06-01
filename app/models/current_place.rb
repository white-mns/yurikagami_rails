class CurrentPlace < ApplicationRecord
	belongs_to :party_info, :foreign_key => [:result_no, :party_no, :generate_no], :primary_key => [:result_no, :party_no, :generate_no], :class_name => 'PartyInfo'
	belongs_to :place, :foreign_key => :place_id,    :primary_key => :proper_id, :class_name => 'ProperName'
end
