require "open-uri"

puts 'Cleaning the database'

Movie.destroy_all

images = ['https://image.winudf.com/v2/image1/Y29tLm9ubHlzbWFydGFwcHMua3VtYXdvb2RmdW5ueXZpZGVvc19zY3JlZW5fMV8xNTUyNTk3MDE2XzAzMg/screen-1.jpg?fakeurl=1&type=.jpg',
          'https://i.ytimg.com/vi/SBfjZ7eKIXg/maxresdefault.jpg',
          'https://i.ytimg.com/vi/S20nYmKn2x0/maxresdefault.jpg',
          'https://i.ytimg.com/vi/Qt7hjixDSLk/maxresdefault.jpg',
          'https://i.ytimg.com/vi/kFjIp13hmuw/maxresdefault.jpg',
          'https://i.ytimg.com/vi/y9Ad3mqSiPQ/maxresdefault.jpg']

10.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    director: Faker::DcComics.villain,
    user_id: 1,
     category_id: rand(1..4)
    )
    file = URI.open(images.sample)
    movie.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  puts "#{movie.title} done"
  movie.save!
end
puts 'Done'
