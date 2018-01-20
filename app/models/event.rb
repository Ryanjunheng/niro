class Event < ApplicationRecord
  belongs_to :host, polymorphic: true
  has_one :badge
  has_many :event_messages

  has_many :participations
  has_many :users, through: :participations

  mount_uploaders :photos, PhotosUploader
  serialize :photos, Array

  geocoded_by :address
  after_validation :geocode
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  def full_address
      [:address, :city, :state, :country].compact.join(', ')
  end

end
