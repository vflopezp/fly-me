# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

file1 = URI.open('https://images.unsplash.com/photo-1550740850-48b638b91c65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2414&q=80')
file2 = URI.open('https://images.unsplash.com/photo-1551748629-08d916ed6682?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2829&q=80')
file3 = URI.open('https://images.unsplash.com/flagged/photo-1555685460-1d9cf532761b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2425&q=80')

Airplane.destroy_all

User.destroy_all

Rating.destroy_all
Booking.destroy_all
puts "db is clean now"
role = ["owner", "renter"]
location = ["mexico city","california","madrid"]
4.times do
  users = User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, passport_number: Faker::Code.asin, email: Faker::Internet.email, role: role.sample,password: "123456789")
  if users.role = "owner"
    1.times do
      Airplane.create!(capacity:rand(1..20),model:Faker::Vehicle.model, price:rand(900.0..10000.0).round(2),booked:false, owner: users, rating:rand(0..5), address: location.sample)
    end
  end
end
plane1 = Airplane.first
plane1.photos.attach(io: file1, filename: 'plane1.png', content_type: 'image/png')
plane1.photos.attach(io: file2, filename: 'plane2.png', content_type: 'image/png')
plane1.photos.attach(io: file3, filename: 'plane3.png', content_type: 'image/png')

puts "db is now seeded"
