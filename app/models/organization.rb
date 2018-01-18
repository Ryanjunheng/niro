class Organization < ApplicationRecord
	belongs_to :user

	enum verification: { Unverified: 0, Verified: 1 }
end
