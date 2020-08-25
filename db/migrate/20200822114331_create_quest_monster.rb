class CreateQuestMonster < ActiveRecord::Migration[6.0]
  def change
    create_table :quest_monsters do |t|
      t.belongs_to :quest, null: false, foreign_key: true, comment: "クエストID"
      t.belongs_to :monster, null: false, foreign_key: true, comment: "モンスターID"
      t.integer :volume, comment: "討伐数"
    end
  end
end
