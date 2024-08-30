require 'json'
require 'open-uri'

Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
data = JSON.parse(URI.open(url).read)

puts "Generating database ..."

data["results"].each do |movie|
  puts movie["title"]
  movie_info = {
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
    rating: movie["vote_average"].round(1)
  }
  Movie.create(movie_info)
end
# puts data["results"][0]
# puts data["results"][0]["title"]
puts "Seed finished"

  # movie_info = {
#   title:
#   overview:
#   poster_url:
#   rating:
# }


# Movie.create(
#   title: "Wonder Woman 1984",
#   overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
#   poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(
#   title: "The Shawshank Redemption",
#   overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
#   poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(
#   title: "Titanic",
#   overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
#   poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
#   rating: 7.9)
# Movie.create(
#   title: "Ocean's Eight",
#   overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
#   poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
#   rating: 7.0)# This file should ensure the existence of records required to run the application in every environment (production,
# Movie.create(
#   title: "The Good, the Bad and the Ugly",
#   overview: "While the Civil War rages on between the Union and the Confederacy, three men – a quiet loner, a ruthless hitman, and a Mexican bandit – comb the American Southwest in search of a strongbox containing $200,000 in stolen gold.",
#   poster_url: "https://image.tmdb.org/t/p/original/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg",
#   rating: 8.5)
# Movie.create(
#   title: "Seven Samurai",
#   overview: "A samurai answers a village's request for protection after he falls on hard times. The town needs protection from bandits, so the samurai gathers six others to help him teach the people how to defend themselves, and the villagers provide the soldiers with food.",
#   poster_url: "https://image.tmdb.org/t/p/original/8OKmBV5BUFzmozIC3pPWKHy17kx.jpg",
#   rating: 9.0)
# Movie.create(
#   title: "The Count of Monte-Cristo",
#   overview: "Edmond Dantes becomes the target of a sinister plot and is arrested on his wedding day for a crime he did not commit. After 14 years in the island prison of Château d’If, he manages a daring escape. Now rich beyond his dreams, he assumes the identity of the Count of Monte-Cristo and exacts his revenge on the three men who betrayed him.",
#   poster_url: "https://image.tmdb.org/t/p/original/aHRUsFln97FlIdsvYKFT3z5ubYE.jpg",
#   rating: 7.0)
  # This file should ensure the existence of records required to run the application in every environment (production,

# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
