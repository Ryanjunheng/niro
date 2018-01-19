class Event < ApplicationRecord
  belongs_to :host, polymorphic: true
  has_one :badge
  has_many :messages, through: :event_messages

  enum allocated_points: [5, 10, 20]

  mount_uploaders :photos, PhotosUploader
  serialize :photos, Array

  geocoded_by :full_address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def full_address
      [:address, :city, :state, :country].compact.join(', ')
  end

end
