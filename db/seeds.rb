# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed Users
require 'faker'

user = {}
user['password'] = 'asdf'
# user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do
    user['full_name'] = Faker::Name.first_name
    user['email'] = Faker::Internet.email
    user['phone'] = Faker::PhoneNumber.phone_number
    user['city'] = Faker::Address.city
    user['state'] = Faker::Address.state
    user['country'] = Faker::Address.country
    user['intro'] = Faker::HowIMetYourMother.quote
    user['documents'] = Faker::File.mime_type
    user['avatar'] = Faker::Avatar.image("my-own-slug")

    User.create(user)
  end
end

# Seed Listings
event = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  100.times do
    event['name'] = Faker::App.name
    event['description'] = Faker::Lorem.paragraphs
    event['event_type'] = ["Donation", "Campaign", "Volunteer", "Community"].sample
    event['status'] = "Unapproved"
    event['report_count'] = 0
    event['required_participants'] = rand(15..110)
    event['actual_participants'] = 0
    event['allocated_points'] = 0
    event['start_date'] = Faker::Date.forward(23)
    event['end_date'] = Faker::Date.forward(30)
    event['start_time'] = Faker::Time.forward(23, :morning)
    event['end_time'] = Faker::Time.forward(30, :evening)
    event['address'] = Faker::Address.street_address
    event['city'] = Faker::Address.city
    event['state'] = Faker::Address.state
    event['country'] = Faker::Address.country
    event['zip_code'] = 12345
    event['host'] = User.all[rand(0..39)]

    a = Event.new(event)
    unless a.save
      p a.errors
      raise 'stop'
    end
  end
end
