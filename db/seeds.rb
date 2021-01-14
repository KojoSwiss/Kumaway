# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning the database'

Movie.destroy_all

10.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    director: Faker::DcComics.villain,
    user_id: 1,
     category_id: rand(1..4)
    )
    # file = URI.open(images.sample)
    # tailor.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  puts "#{movie.title} done"
  movie.save!
end
puts 'Done'
