class CreateFields < ActiveRecord::Migration[6.0]
  def change
    create_table :fields do |t|
      t.string :name, null: false, comment: "フィールド名"

      t.timestamps
    end
  end
end
