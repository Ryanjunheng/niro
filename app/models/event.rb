class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_man :messages, through: :event_messages
end
