# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airplane.destroy_all
User.destroy_all
Rating.destroy_all
Booking.destroy_all
puts "db is clean now"
role = ["owner", "renter"]
10.times do
  users = User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, passport_number: Faker::Code.asin, email: Faker::Internet.email, role: role.sample,password: "123456789")
  if users.role = "owner"
    2.times do
      Airplane.create!(capacity:rand(1..20),model:Faker::Vehicle.model, price:rand(900.0..10000.0).round(2),booked:false, owner: users, rating:rand(0..5))
    end
  end
end

puts "db is now seeded"
