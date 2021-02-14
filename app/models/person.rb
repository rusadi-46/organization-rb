class Person < ApplicationRecord
	has_one_attached :avatar
	belongs_to :organization

	def self.search(search)
	  	where("name LIKE ?", "%#{search}%") 
	end 
end
