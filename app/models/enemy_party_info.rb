class EnemyPartyInfo < ApplicationRecord
	belongs_to :current_place, :foreign_key => [:result_no, :party_no, :generate_no], :primary_key => [:result_no, :party_no, :generate_no], :class_name => 'CurrentPlace'
	belongs_to :party_info,    :foreign_key => [:result_no, :party_no, :generate_no], :primary_key => [:result_no, :party_no, :generate_no], :class_name => 'PartyInfo'
	has_many :enemy_members,:foreign_key => [:result_no, :party_no, :generate_no], :primary_key => [:result_no, :party_no, :generate_no], :class_name => 'Enemy'
end
