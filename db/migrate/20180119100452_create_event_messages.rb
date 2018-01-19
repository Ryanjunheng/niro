class CreateEventMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :event_messages do |t|
      t.references :event, foreign_key: true, on_delete: :cascade
      t.text :message
      t.timestamps
    end
  end
end