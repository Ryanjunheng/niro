class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|

      t.references :user, foreign_key: true, on_delete: :cascade, null: true
      t.references :event, foreign_key: true, on_delete: :cascade, null: true
      t.timestamps
    end
  end
end
