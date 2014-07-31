s = Location.create(name: "La Jodida", city: "Begur", country: "Spain" )
s1=Location.create(name: "El pillao", city: "Girona", country: "Spain" )
s2=Location.create(name: "Los monges", city: "Tarragona", country: "Norway" )
s3=Location.create(name: "Porta Ventura", city: "Tarragona", country: "USA" )
s4=Location.create(name: "La Maria", city: "Estartit", country: "Spain" )
s5=Location.create(name: "La pocina", city: "La Manga", country: "Franchuten" )
s6=Location.create(name: "COrner", city: "Corcho", country: "Germany" )
s7=Location.create(name: "Mola", city: "Ojo", country: "Mallorca" )


img = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/barcelona.jpeg")
s.avatar = img
img.close
s.save!

img1 = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/valencia.jpeg")
s1.avatar = img1
img1.close
s1.save!

img2 = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/download.jpeg")
s2.avatar = img2
img2.close
s2.save!

img3 = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/newyork.jpeg")
s3.avatar = img3
img3.close
s3.save!

img4 = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/paris.jpeg")
s4.avatar = img4
img4.close
s4.save!

img5 = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/seattle.jpeg")
s5.avatar = img5
img5.close
s5.save!

img6 = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/tokyo.jpeg")
s6.avatar = img6
img6.close
s6.save!

img7 = File.open("/Users/kristiankyvik/Ironhack/code/week3/day1/images/berlin.jpeg")
s7.avatar = img7
img7.close
s7.save!


# arr = (1..100).to_a

# arr.sample

# us1 = User.create( user_name: "pepito")
# us2 = User.create( user_name: "juanito")
# us3 = User.create( user_name: "Goran")
# us4 = User.create( user_name: "lolita")
# us5 = User.create( user_name: "huan")
# us6 = User.create( user_name: "merchecita")
# us7 = User.create( user_name: "walt")


# Visit.create(location_id: s.id, user_id: us1.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
# Visit.create(location_id: s1.id, user_id: us2.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
# Visit.create(location_id: s2.id, user_id: us2.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
# Visit.create(location_id: s2.id, user_id: us4.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
# Visit.create(location_id: s2.id, user_id: us5.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
# Visit.create(location_id: s2.id, user_id: us7.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
# Visit.create(location: s2, user_id: us6.id, from_date: DateTime.now + 1.hour, to_date:DateTime.now + 2.hours)


# # 100.times do 
#   User.create street: Faker::Address.street_address
#   5.times do
#     Comment.create 
#   end
# end



