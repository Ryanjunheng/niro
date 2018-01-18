class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
<<<<<<< HEAD
=======
  has_one :badge 
>>>>>>> 1b03c39cacb4866e50452becf501f3f8dcdad58d
  has_many :messages, through: :event_messages
  enum allocated_points: [5, 10, 20]

end
