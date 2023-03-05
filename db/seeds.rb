# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# install require yaml and open-uri
require 'open-uri'
require 'yaml'
require 'faker'

Pet.destroy_all
User.destroy_all

puts 'Cleaning done!'

puts 'Creating fake users and pets...'

# Generating 5 users:
unsplash_images = Unsplash::Photo.search('headshot', 1, 5)

unsplash_images.each do |image|
  user = User.new(
    email: Faker::Internet.safe_email,
    password: "password",
    password_confirmation: "password"
  )
  file = URI.open(image.urls.small)
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  user.save!
  end
# ==========

# Generating 5 of each animal listed in the variable animals:
animals = [ {species: 'dog', max_age: 10},
            {species: 'cat', max_age: 20},
            {species: 'rabbit', max_age: 5},
            {species: 'duck', max_age: 10},
            {species: 'hamster', max_age:2},
            {species: 'iguana', max_age:10},
            {species: 'parrot', max_age:100}
          ]

animals.each do |animal|
puts animal
  unsplash_images = Unsplash::Photo.search(animal[:species], 1, 5)

  unsplash_images.each do |image|
    pet = Pet.new(
      name: Faker::Creature::Dog.name,
      species: animal[:species],
      sex: Faker::Gender.binary_type,
      neutered: [true, false].sample,
      age: rand(0..animal[:max_age]),
      user: User.all.sample,
      special_instructions: image.description
    )
    file = URI.open(image.urls.small)
    pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
    pet.save!
  end
end
# ==========

puts 'Finished!'
