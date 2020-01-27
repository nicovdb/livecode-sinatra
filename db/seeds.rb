require 'faker'

10.times do
  r = Restaurant.new(
    name: Faker::Games::Pokemon.name,
    address: Faker::Games::Pokemon.location,
    rating: rand(0..5)
  )
  r.save!
  puts "#{r.name}"
end
