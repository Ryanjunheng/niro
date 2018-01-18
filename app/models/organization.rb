class Organization < ApplicationRecord
	belongs_to :user
	has_many :events 

	enum verification: { Unverified: 0, Verified: 1 }
end
