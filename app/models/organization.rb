class Organization < ApplicationRecord

	belongs_to :user
	has_many :events, as: :host
	has_many :reportings, as: :reported

	enum verification: { Unverified: 0, Verified: 1 }

	mount_uploader :logo, LogoUploader
	mount_uploaders :documents, DocumentsUploader
	serialize :documents, Array

	geocoded_by :full_address
	after_validation :geocode
	# reverse_geocoded_by :latitude, :longitude
	# after_validation :reverse_geocode

	def full_address
			[:address, :city, :state, :zip_code.to_s].compact.join(', ')
	end
end
