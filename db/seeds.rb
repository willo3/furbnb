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

# Generating 5 dogs:
unsplash_images = Unsplash::Photo.search('dog', 1, 5)

unsplash_images.each do |image|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: 'Dog',
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..8),
    user: User.all.sample,
    special_instructions: image.description
  )
  file = URI.open(image.urls.small)
  pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  pet.save!
end
# ==========

# Generating 5 cats:
unsplash_images = Unsplash::Photo.search('cat', 1, 5)

unsplash_images.each do |image|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: 'Cat',
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..20),
    user: User.all.sample,
    special_instructions: image.description
  )
  file = URI.open(image.urls.small)
  pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  pet.save!
end
# ==========

# Generating 5 rabbits:
unsplash_images = Unsplash::Photo.search('rabbit', 1, 5)

unsplash_images.each do |image|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: 'Rabbit',
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..5),
    user: User.all.sample,
    special_instructions: image.description
  )
  file = URI.open(image.urls.small)
  pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  pet.save!
end
# ==========

# Generating 5 ducks:
unsplash_images = Unsplash::Photo.search('duck', 1, 5)

unsplash_images.each do |image|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: 'Duck',
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..15),
    user: User.all.sample,
    special_instructions: image.description
  )
  file = URI.open(image.urls.small)
  pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  pet.save!
end
# ==========

# Generating 5 hamsters:
unsplash_images = Unsplash::Photo.search('hamster', 1, 5)

unsplash_images.each do |image|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: 'Hamster',
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..2),
    user: User.all.sample,
    special_instructions: image.description
  )
  file = URI.open(image.urls.small)
  pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  pet.save!
end
# ==========

# Generating 5 iguanas:
unsplash_images = Unsplash::Photo.search('iguana', 1, 5)

unsplash_images.each do |image|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: 'Iguana',
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..15),
    user: User.all.sample,
    special_instructions: image.description
  )
  file = URI.open(image.urls.small)
  pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  pet.save!
end
# ==========

# Generating 5 parrots:
unsplash_images = Unsplash::Photo.search('parrot', 1, 5)

unsplash_images.each do |image|
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: 'Parrot',
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..25),
    user: User.all.sample,
    special_instructions: image.description
  )
  file = URI.open(image.urls.small)
  pet.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  pet.save!
end
# ==========

puts 'Finished!'
