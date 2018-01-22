class EventMessagesAddUserReferences < ActiveRecord::Migration[5.1]
  def change
  add_reference :event_messages, :user, foreign_key:true, on_delete: :cascade
  end
end
