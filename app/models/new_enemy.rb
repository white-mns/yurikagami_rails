class NewEnemy < ApplicationRecord
	belongs_to :enemy_name, :foreign_key => :enemy,    :primary_key => :enemy_id, :class_name => 'EnemyName'
end
