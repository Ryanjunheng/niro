class User < ApplicationRecord
  include Clearance::User
<<<<<<< HEAD
  has_many :messages
=======
  has_many :messages 
>>>>>>> master
  has_many :organizations
  has_many :followers, through: :followings
  has_many :user_scores

  enum verification: { Unverified: 0, Verified: 1 }
  enum role: { user: 0, moderator: 1, superadmin: 2 }
<<<<<<< HEAD
end
=======
end
>>>>>>> master
