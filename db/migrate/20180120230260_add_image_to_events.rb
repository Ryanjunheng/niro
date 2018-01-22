class AddImageToEvents < ActiveRecord::Migration[5.1]
	def change
    	add_column :events, :image, :json
  	end
end