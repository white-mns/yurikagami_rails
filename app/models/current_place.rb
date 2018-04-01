class CurrentPlace < ApplicationRecord
	belongs_to :party_info, :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'PartyInfo'
	belongs_to :place_name, :foreign_key => :place,    :primary_key => :place_id, :class_name => 'PlaceName'
end
