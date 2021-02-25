# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

pet_picture = URI.open('https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png')
user1 = User.new(username: "Snoopy", email: "thomas@gmail.com", password: "password123")
user1.photo.attach(io: pet_picture, filename: 'pet1.png', content_type: 'image/png')
user1.save!
