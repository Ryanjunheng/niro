class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
<<<<<<< HEAD

=======
      t.references :event, foreign_key: true, on_delete: :cascade, null: false
      t.json :image
>>>>>>> 1b03c39cacb4866e50452becf501f3f8dcdad58d
      t.timestamps
    end
  end
end
