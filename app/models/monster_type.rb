class MonsterType < ApplicationRecord

  def type_map
    MonsterType.all.pluck(:id, :type_name).to_h
  end
end