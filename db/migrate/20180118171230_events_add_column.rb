class EventsAddColumn < ActiveRecord::Migration[5.1]
  def change
  remove_column :events, :user_id, :references
  remove_column :events, :organization_id, :references
  add_reference :events, :host, polymorphic: true, index: true
  end
end
