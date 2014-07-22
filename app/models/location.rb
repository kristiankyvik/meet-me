class Location < ActiveRecord::Base
	has_many :visits
	def self.finder(id1)
		where(id: id1).first
	end

	def self.last_created(number)
		order("created_at ASC").limit(number)
	end

	def self.is_spanish
		where(country: "Spain")
	end
end
