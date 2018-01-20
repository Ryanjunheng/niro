class Participation < ApplicationRecord
	belongs_to :user
	belongs_to :event
	enum status: ["In Progress", "Completed", "Failed"]
end
