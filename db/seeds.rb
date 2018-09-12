# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
center_point = { lat: 43.156338, lng: 282.385696 }
 
1.upto(100) do |i|
  Location.create!(
    name: Faker::Address.city,
    description: Faker::Lorem.paragraph(8),
    longitude: center_point[:lng] + rand(-10.00..10.00),
    latitude: center_point[:lat] + rand(-10.00..10.00),
    
  )
end

