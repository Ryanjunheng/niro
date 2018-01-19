class CreateUserMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_messages do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.text :message
      t.timestamps
    end
  end
end
