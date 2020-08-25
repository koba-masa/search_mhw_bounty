class CreateQuestRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :quest_ranks do |t|
      t.string :name, null: false, comment: "ランク"

      t.timestamps
    end
  end
end
