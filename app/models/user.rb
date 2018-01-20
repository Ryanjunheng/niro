class User < ApplicationRecord
  include Clearance::User

  has_many :user_messages
  has_many :organizations
  has_many :user_scores
  has_many :events, as: :host
  has_many :authentications, dependent: :destroy
  has_many :event_messages

  has_many :participations
  has_many :events, through: :participations

  enum verification: { Unverified: 0, Verified: 1 }
  enum role: { user: 0, moderator: 1, superadmin: 2 }

  mount_uploader :avatar, AvatarUploader
  mount_uploaders :documents, DocumentsUploader
  serialize :documents, Array

  def self.create_with_auth_and_hash(authentication, auth_hash)
     user = self.create!(
      full_name: auth_hash["extra"]["raw_info"]["name"],
       email: auth_hash["extra"]["raw_info"]["email"],
       remote_avatar_url: auth_hash["info"]["image"],
       password: SecureRandom.hex(16)
     )
     user.authentications << authentication
     return user
  end

   # grab fb_token to access Facebook for user data
   def fb_token
     x = self.authentications.find_by(provider: 'facebook')
     return x.token unless x.nil?
   end

end
