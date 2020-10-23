# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
van = Mechanic.create!(name: "Van Stone-arm", experience: 7)
old_greg = Mechanic.create!(name: "Greg", experience: 35)

six_flags = AmusementPark.create!(name: "Six Flags Great America", price: 45)

american_eagle = six_flags.rides.create!(name: "American Eagle", thrill_rating: 7)
raging_bull = six_flags.rides.create!(name: "Raging Bull", thrill_rating: 9)
giant_drop = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 10)
v2 = six_flags.rides.create!(name: "V2", thrill_rating: 7)

RideMechanic.create!(mechanic_id: van.id, ride_id: american_eagle.id)
RideMechanic.create!(mechanic_id: van.id, ride_id: raging_bull.id)
RideMechanic.create!(mechanic_id: van.id, ride_id: giant_drop.id)
