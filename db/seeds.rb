# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

30.times do
  Article.create!(title: Faker::Lorem.sentence(word_count: rand(2..10)).chomp('.'),
                  body: Faker::Lorem.words(number: rand(10..30)).join(' '))
end