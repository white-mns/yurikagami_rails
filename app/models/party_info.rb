class PartyInfo < ApplicationRecord
	has_many :party_members, :foreign_key => [:result_no, :party_no, :generate_no], :primary_key => [:result_no, :party_no, :generate_no], :class_name => 'Party'
end
