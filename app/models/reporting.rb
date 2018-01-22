class Reporting < ApplicationRecord
  belongs_to :reported, polymorphic: true
  enum status: ["Pending", "Confirmed", "Resolved"]

end
