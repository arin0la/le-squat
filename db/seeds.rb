# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
puts 'cleaning the database...'
User.destroy_all
Toilet.destroy_all

puts 'creating a user...'
user = User.create(email: "needtoilet@gmail.com", password: 123456)
puts "creating toilets....."
5.times do
  toilet = Toilet.create(
    name: Faker::Name.first_name,
    description: Faker::Emotion.adjective,
    price: rand(100),
    user_id: user.id
  )
end
puts "Created #{Toilet.count} toilets"
