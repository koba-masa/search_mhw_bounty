class QuestRank < ApplicationRecord
  def three_rank_map
    {"1" => "下位" , "6" => "上位", "10" => "マスター"}
  end
end