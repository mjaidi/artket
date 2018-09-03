require 'date'

puts "Cleaning Database"

Cloudinary::Api.delete_all_resources
ArtPhoto.destroy_all
Artwork.destroy_all
Artist.destroy_all
Exhibition.destroy_all
Gallery.destroy_all
JoinArtCategory.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating Data Arrays"

home_banner = "http://wossthemes.com/artday/wp-content/uploads/2016/07/01_slider_image.jpg"

artwork_photos = ["http://wossthemes.com/artday/wp-content/uploads/2016/01/product_19.png", 
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_18.png",
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_17.png",
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_15.png",
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_14.png",
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_13.png",
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_20.png",
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_21.png",
           "http://wossthemes.com/artday/wp-content/uploads/2016/01/product_23.png"
           ]

categories = ["Peinture", "Sculpture", "Photographie", "Editions", "Dessin"]


now = Date.today
a_millenia_ago = now - 365*1000


puts "Adding Data"

#seeding users
test_user = User.create!(email: "majid@gmail.com", password: "123456789")

#seeding categories
categories.each do |category|
  Category.create!(name: category)
end

start_categories_id = Category.first.id
end_categories_id = Category.last.id

#seeding Galleries
gallery1 = Gallery.create!(user_id: test_user.id, name: "Artket", description: Faker::Lorem.paragraph(2, false, 6), full_address: "Casablanca, Morocco", email: "artket@artket.ma", phone: "0522625545")
gallery2 = Gallery.create!(user_id: test_user.id, name: "Thema", description: Faker::Lorem.paragraph(2, false, 6), full_address: "Marrakech, Morocco", email: "thema@thema.ma", phone: "0524512548" )

#seeding Exhibitions
exhibition1 = Exhibition.create!(gallery_id: gallery1.id, name: "Artket Peinture", description: Faker::Lorem.paragraph(2, false, 6), start_date: (now - 10), end_date: (now + 50))
exhibition2 = Exhibition.create!(gallery_id: gallery2.id, name: "Thema Photographie", description: Faker::Lorem.paragraph(2, false, 6), start_date: (now + 15), end_date: (now + 95))

#seeding artists

5.times do 
  random_date = rand(a_millenia_ago..now)
  random_age = random_date + rand(25..90)
  Artist.create!(name: Faker::Artist.name, description: Faker::Lorem.paragraph, birth_date: random_date, death_date: random_age)
end
start_artist_id = Artist.first.id
end_artist_id = Artist.last.id

#seeding artwork

i = 0

9.times do 
art = Artwork.create!(gallery_id: [gallery1.id, gallery2.id].sample, exhibition_id: [exhibition1.id, exhibition2.id].sample, artist_id: rand(start_artist_id..end_artist_id),
                      name: Faker::Ancient.hero, description: Faker::Lorem.paragraph, dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))  
art.year = rand(art.artist.birth_date..art.artist.death_date)
art.save

photo = ArtPhoto.new(artwork_id: art.id)
photo.remote_photo_url = artwork_photos[i]
i += 1
photo.save

JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
end

 

puts "Seed Completed"
