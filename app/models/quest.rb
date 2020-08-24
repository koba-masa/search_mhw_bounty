class Quest < ApplicationRecord
  belongs_to :field
  belongs_to :quest_rank

  def quest_map
    {"フリー" => "フリー", "イベント" => "イベント"}
  end
end