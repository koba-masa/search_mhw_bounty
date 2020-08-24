class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name, null: false, comment: "モンスター名"
      t.belongs_to :monster_type, null: false, foreign_key: true, comment: "種別"

      t.timestamps
    end
  end
end
