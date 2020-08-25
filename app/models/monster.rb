class Monster < ApplicationRecord
  belongs_to :monster_type

  def monster_map
    Monster.all.pluck(:id, :name).to_h
  end
end