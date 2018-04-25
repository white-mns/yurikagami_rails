class EnemyPartyInfo < ApplicationRecord
	belongs_to :party_info, :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'PartyInfo'
	has_many :enemy_members,:foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'Enemy'
end
