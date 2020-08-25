class HomeController < ApplicationController
  # GET /homes
  def index
    @quest_monsters = nil
    if not params.has_key?(:quest)
      return
    end
    bownties = params[:quest]
    bownties.each do |key, bownty|
      if not bownty.has_key?(:conditions)
        next
      end
      quests = search(bownty)
      if @quest_monsters.blank?
        @quest_monsters = quests
      else
        tmp_quest_monsters = @quest_monsters.clone.merge(quests)
        if tmp_quest_monsters.present?
          @quest_monsters = tmp_quest_monsters
        else
          @quest_monsters = @quest_monsters.or(quests)
        end
      end
    end
    @quest_monsters = QuestMonster.where(quest_id: @quest_monsters.pluck(:quest_id))
  end

  def search(bownty)
    condition_key = bownty[:conditions]
    quest = nil
    if condition_key == "quest"
      quest = search_quest_by_quest(bownty[:rank], bownty[:quest])
    elsif condition_key == "field"
      quest = search_quest_by_field(bownty[:rank], bownty[:field])
    elsif condition_key == "type"
      quest = search_quest_by_type(bownty[:rank], bownty[:type])
    elsif condition_key == "monster"
      quest = search_quest_by_monster(bownty[:rank], bownty[:monster])
    end
    return quest
  end

  def search_quest_by_quest(rank, condition)
    return QuestMonster.joins(:quest, :monster).where("quests.quest_rank_id >= ? AND quests.quest_type = ?", rank, condition)
  end

  def search_quest_by_field(rank, condition)
    return QuestMonster.joins(:quest, :monster).where("quests.quest_rank_id >= ? AND quests.field_id = ?", rank, condition)
  end

  def search_quest_by_type(rank, condition)
    return QuestMonster.joins(:quest, :monster).where("quests.quest_rank_id >= ? AND monsters.monster_type_id = ?", rank, condition)
  end

  def search_quest_by_monster(rank, condition)
    return QuestMonster.joins(:quest, :monster).where(monster_id: condition)
  end

end
