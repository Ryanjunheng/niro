class EventsAddHostRewards < ActiveRecord::Migration[5.1]
  def change
  add_column :events, :host_rewards, :text, null: true
  end
end
