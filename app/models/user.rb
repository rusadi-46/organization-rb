class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  def self.search(search)
	  	where("name LIKE ?", "%#{search}%") 
	end
end
