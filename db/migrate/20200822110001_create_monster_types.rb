class CreateMonsterTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :monster_types do |t|
      t.string :type_name, null: false, unique: true, comment: "種別"

      t.timestamps
    end
  end
end
