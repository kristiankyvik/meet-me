
json.visits @visits do |visit|
  json.from visit.from_date
  json.to visit.to_date
end