# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# install require yaml and open-uri
require "open-uri"
require "yaml"
require 'faker'

puts 'Cleaning the databases...'

Pet.destroy_all
User.destroy_all

puts 'Cleaning done!'

puts 'Creating 100 fake users and pets...'

user1 = User.create(
  email: 'email1@email.com',
  password: '123456',
  password_confirmation: '123456'
)

user2 = User.create(
  email: 'email2@email.com',
  password: '123456',
  password_confirmation: '123456'
)

user3 = User.create(
  email: 'email3@email.com',
  password: '123456',
  password_confirmation: '123456'
)

user4 = User.create(
  email: 'email4@email.com',
  password: '123456',
  password_confirmation: '123456'
)

user5 = User.create(
  email: 'email5@email.com',
  password: '123456',
  password_confirmation: '123456'
)

animals = ['Cat', 'Dog', 'Rabbit', 'Duck', 'Hamster', 'Iguana', 'Parrot']

100.times do
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    species: animals.sample,
    sex: Faker::Gender.binary_type,
    neutered: [true, false].sample,
    age: rand(0..100),
    user: User.all.sample
  )
  pet.save!
end
puts 'Finished!'
