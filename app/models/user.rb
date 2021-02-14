class User < ApplicationRecord
	has_secure_password
	has_many :organization

	validates :email, presence: true, uniqueness: true

  	def self.search(search)
	  	where("name LIKE ?", "%#{search}%") 
	end

	def not_organization?
	  self.organization.nil?
	end
end
