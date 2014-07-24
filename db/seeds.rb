s = Location.create(name: "La Jodida", city: "Begur", country: "Spain" )
s1=Location.create(name: "El pillao", city: "Girona", country: "Spain" )
s2=Location.create(name: "Los monges", city: "Tarragona", country: "Norway" )
Location.create(name: "Porta Ventura", city: "Tarragona", country: "USA" )
Location.create(name: "La Maria", city: "Estartit", country: "Spain" )



arr = (1..100).to_a

arr.sample

us1 = User.create( user_name: "pepito", name: "quillo")
us2 = User.create( user_name: "juanito", name: "juan")
us3 = User.create( user_name: "Goran", name: "jose")
us4 = User.create( user_name: "lolita", name: "lola")
us5 = User.create( user_name: "huan", name: "paco")
us6 = User.create( user_name: "merchecita", name: "merche")
us7 = User.create( user_name: "walt", name: "juan")


Visit.create(location_id: s.id, user_id: us1.id, from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s1.id, user_id: us2.id, from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_id: us2.id, from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_id: us4.id, from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_id: us5.id, from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_id: us7.id, from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location: s2, user_id: us6.id, from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)






