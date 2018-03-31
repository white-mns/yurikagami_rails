class PartyInfo < ApplicationRecord
	has_many :party_members,	    :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'Party'
end
