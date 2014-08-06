json.location do
  json.location_id @location.location_id
  json.name @location.name
  json.city @location.city    
  json.zip_code @location.zip_code  
  json.street @location.street 
  json.country @location.country 
  json.description @location.description
  json.img_url @location.avatar.url
end