class Organization < ApplicationRecord
	has_one_attached :logo
	has_many :person
	belongs_to :user

	def self.search(search)
	  	where("name LIKE ?", "%#{search}%") 
	end

end
