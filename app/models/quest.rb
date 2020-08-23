class Quest < ApplicationRecord
  belongs_to :field

  def quest_map
    {"フリー" => "フリー", "イベント" => "イベント"}
  end
end