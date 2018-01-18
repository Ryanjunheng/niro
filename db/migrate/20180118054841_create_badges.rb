class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.reference :event, foreign_key: true, on_delete: :cascade, null: false
      t.json :image
      t.timestamps
    end
  end
end
