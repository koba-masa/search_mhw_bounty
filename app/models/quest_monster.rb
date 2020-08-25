class QuestMonster < ApplicationRecord
  belongs_to :quest
  belongs_to :monster
end