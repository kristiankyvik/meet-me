json.visits @visit do |v|
  json.content "nothing really"
  json.from v.from_date
  json.to v.to_date
end