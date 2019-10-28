require 'faker'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Beer.brand,
    address: "#{Faker::Address.street_name}, #{Faker::Address.city}",
    rating: rand(0..10)
  )
  restaurant.save!
  puts "created #{restaurant.name}"
end
