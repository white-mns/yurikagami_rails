class BattleResult < ApplicationRecord
	belongs_to :enemy_party_info, :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'EnemyPartyInfo'
	belongs_to :income,           :foreign_key => [:party_no, :result_no, :generate_no], :primary_key => [:party_no, :result_no, :generate_no], :class_name => 'Income'
end
