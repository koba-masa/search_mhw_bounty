class QuestRank < ApplicationRecord
  def three_rank_map
    {"下位" => 1, "上位" => 6, "マスター" => 10}
  end
end