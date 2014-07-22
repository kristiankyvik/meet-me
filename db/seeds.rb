s = Location.create(name: "La Jodida", city: "Begur", country: "Spain" )
s1=Location.create(name: "El pillao", city: "Girona", country: "Spain" )
s2=Location.create(name: "Los monges", city: "Tarragona", country: "Norway" )
Location.create(name: "Porta Ventura", city: "Tarragona", country: "USA" )
Location.create(name: "La Maria", city: "Estartit", country: "Spain" )



arr = (1..100).to_a

arr.sample


Visit.create(location_id: s.id, user_name: "pepito", from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s1.id, user_name: "juanito", from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_name: "Goran", from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_name: "lolita", from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_name: "huan", from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location_id: s2.id, user_name: "ajsdhkas", from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)
Visit.create(location: s2, user_name: "joasjkdhaskjdhan", from_date: DateTime.now, to_date: DateTime.now + arr.sample.hour)



