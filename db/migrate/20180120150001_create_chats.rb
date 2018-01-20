class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :user, foreign_key: true, on_cascade: :delete
      t.text :chat
      t.timestamps
    end
  end
end
