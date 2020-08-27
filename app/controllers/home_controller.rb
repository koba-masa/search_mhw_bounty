class HomeController < ApplicationController
  # GET /homes
  def index
    @bounties = {}
    @quest_count = 0
    @quest_monsters = nil
    if not params.has_key?(:quest)
      return
    end
    @bounties = params[:quest]
    @bounties.each do |key, bounty|
      next if not bounty.has_key?(:conditions)
      quests = search(bounty)
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
    @quest_monsters = QuestMonster.where(quest_id: @quest_monsters.pluck(:quest_id)) if @quest_monsters.present?
    @quest_count = @quest_monsters.select(:quest_id).distinct.length if @quest_monsters.present?
  end

  def search(bounty)
    condition_key = bounty[:conditions]
    quest = nil
    if condition_key == "quest"
      quest = search_quest_by_quest(bounty[:rank], bounty[:quest])
    elsif condition_key == "field"
      quest = search_quest_by_field(bounty[:rank], bounty[:field])
    elsif condition_key == "type"
      quest = search_quest_by_type(bounty[:rank], bounty[:type])
    elsif condition_key == "monster"
      quest = search_quest_by_monster(bounty[:rank], bounty[:monster])
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
    return QuestMonster.joins(:quest, :monster).where("quests.quest_rank_id >= ? AND monster_id = ?", rank, condition)
  end

end
