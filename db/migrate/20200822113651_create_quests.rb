class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.string :type, null: false, comment: "クエスト種別"
      t.belongs_to :quest_rank, null: false, foreign_key: true, comment: "クエストランク"
      t.string :name, null: false, comment: "クエスト名"
      t.belongs_to :field, null: false, foreign_key: true, comment: "フィールド"
      t.integer :volume, null: false, comment: "対象種類数"

      t.timestamps
    end
  end
end
