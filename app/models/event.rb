class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :messages, through: :event_messages
  enum allocated_points: [5, 10, 20]

end
