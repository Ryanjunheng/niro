class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true, null: true, on_delete: :cascade
      t.references :organization, foreign_key: true, null: true, on_delete: :cascade
      t.text :message 
      t.timestamps
    end
  end
end
