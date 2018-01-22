class RemoveLevelFromUsers < ActiveRecord::Migration[5.1]
	def change
    remove_column :users, :level, :integer
  end
end