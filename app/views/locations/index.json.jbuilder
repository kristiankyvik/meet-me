json.locations @locations do |loc|
  json.location_id loc.location_id
  json.name loc.name
  json.city loc.city    
  json.zip_code loc.zip_code  
  json.street loc.street 
  json.country loc.country 
  json.description loc.description
end