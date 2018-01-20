class Participation < ApplicationRecord
	belongs_to :user
	belongs_to :event
	enum status: [:in_progress, :completed, :failed]
end
