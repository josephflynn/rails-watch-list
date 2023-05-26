# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'faker'

# puts "Cleaning database..."
# Movie.destroy_all
# List.destroy_all
# Bookmark.destroy_all

# puts "Creating restaurants..."

# 20.times do |movie|
#   movie = Movie.create(title: Faker::Movie.title , overview: Faker::Movie.quote, rating: rand(1..10))
#   puts "Created #{movie.name}"
# end
# puts "Finished creating movies!"

# 5.times do |list|
#   list = List.create(name: Faker::Music.genre)
# end

# puts "Finished creating lists(genres)..."

# 40.times do |review|
#   review = Review.create(rating: rand(1..5), content: Faker::Restaurant.review, restaurant: Restaurant.all.sample)
#   puts "Created #{review.rating}"
# end
# puts "All Done!"

require "json"
require "open-uri"
require 'faker'

api_key = "39a0b1c5fd66533f90561f1df16ec91b"
url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{api_key}"
response_serialized = URI.open(url).read
response = JSON.parse(response_serialized)

movie_data = response["results"]

# SEEDING BELOW:

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

puts "Creating Movies..."

movie_data.each do |movie|
  movie = Movie.create(title: movie["title"], overview: movie["overview"], poster_url: movie["poster_path"], rating: movie["vote_average"])
  puts "Created #{movie.title}"
end

puts "Finished creating Movies!"

# @movies = Movies.all

# @movies.each do |list|
#   list = List.create(rating: rand(1..5), content: Faker::Restaurant.review, restaurant: Restaurant.all.sample)
#   puts "Created #{review.rating}"
# end