module UsersHelper

	def print_location_name(visit)
		Location.find(visit.location_id).name
	end
end	
