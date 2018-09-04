require 'date'

puts "Cleaning Database"

ArtPhoto.destroy_all
JoinArtCategory.destroy_all
Artwork.destroy_all
Artist.destroy_all
Exhibition.destroy_all
Gallery.destroy_all
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

gallery_photos = ["https://images.unsplash.com/photo-1515169974372-0a322886d279?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=17ff92f2cf485284a7b604020c146b29",
                  "https://images.unsplash.com/photo-1512722328319-51c3d027c228?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e613fff33a208f65954a4b3d7acc076d"]

artist_photos = ["https://images.unsplash.com/photo-1529111290557-82f6d5c6cf85?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=7ba531e76a0177cd870c73646f392981",
                 "https://images.unsplash.com/photo-1513872900980-460ea4c87668?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=500f0ae7128e772e1f6768516f9239ca",
                 "https://images.unsplash.com/photo-1511546395756-590dffdcdbd1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fb6c2fb68225c3cfac850fdf4a4cee25",
                 "https://images.unsplash.com/photo-1506863530036-1efeddceb993?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=77ac65f35be1387aab93df29a65ab104",
                 "https://images.unsplash.com/photo-1525599428495-0441bd5c67de?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=da3d1d621b4675e6e95f878b0f4493b2"]

exhibition_photos = ["https://images.unsplash.com/photo-1515169273894-7e876dcf13da?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cb3bb8b0e3d3d7bc61e782d41ee4562f",
                     "https://images.unsplash.com/photo-1524014482380-0988169f598d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0d12bb00812a6f0842ef6c728f1e40d9"]

categories = ["Peinture", "Sculpture", "Photographie", "Editions", "Dessin"]
subcategories = [["Abstrait", "Street Art", "Peinture huile", "Acrylique", "Nature", "Pop Art", "Portrait", "Scène de Vie", "Nature Morte", "Naif", "Orientalisme"],
                 ["Bronze", "Acier", "Animale", "Résine", "Bois", "Abstrait", "Marbre", "Murale", "äôer", "Monumentale", "Artisanale"],
                 ["Nu", "Noir et Blanc", "Nature", "Urbaine", "Scène de Vie", "Portrait", "Abstrait", "Animaux", "Icones"],
                 ["Abstrait", "Gravure", "Impression Digitale", "Lithographie", "Pop Art", "Sérigraphie", "Street Art"],
                 ["Aquarelle", "Abstrait", "Street Art", "Collage", "Portrait"]]


now = Date.today
birth = Date.today - 25
a_millenia_ago = now - 365*200


puts "Adding Data"

#seeding users
test_user = User.create!(first_name: "Majid", last_name: "Jaidi", email: "majid@gmail.com", password: "123456789")

#seeding categories
categories.each_with_index do |category, index|
  cat = Category.create!(name: category)
  subcategories[index].each do |subcategory|
    Category.create!(name: subcategory, parent_id: cat.id)
  end
end

start_categories_id = Category.first.id
end_categories_id = Category.last.id

#seeding Galleries
gallery1 = Gallery.create!(user_id: test_user.id, name: "Artket", description: Faker::Lorem.paragraph(2, false, 6), address_line: "Jemaa El Fna", city: "Marrakesh",country: "Morocco", email: "artket@artket.ma", phone: "0522625545")
gallery1.remote_photo_url = gallery_photos[0]
gallery1.save
gallery2 = Gallery.create!(user_id: test_user.id, name: "Thema", description: Faker::Lorem.paragraph(2, false, 6),  address_line: "Maarif", city: "Casablanca",country: "Morocco", email: "thema@thema.ma", phone: "0524512548" )
gallery2.remote_photo_url = gallery_photos[1]
gallery2.save

#seeding Exhibitions
exhibition1 = Exhibition.create!(gallery_id: gallery1.id, name: "Artket Peinture", description: Faker::Lorem.paragraph(2, false, 6), start_date: (now - 10), end_date: (now + 50))
exhibition1.remote_cover_photo_url = exhibition_photos[0]
exhibition2 = Exhibition.create!(gallery_id: gallery2.id, name: "Thema Photographie", description: Faker::Lorem.paragraph(2, false, 6), start_date: (now + 15), end_date: (now + 95))
exhibition2.remote_cover_photo_url = exhibition_photos[1]
exhibition2.save

#seeding artists
i = 0
5.times do
  random_date = rand(a_millenia_ago..birth)
  random_age = random_date + (rand(15..60)*365)
  random_age = now if random_age > now
  artist = Artist.create!(first_name: Faker::Artist.name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, birth_date: random_date, death_date: random_age)
  artist.remote_photo_url = artist_photos[i]
  artist.save
  i += 1
end
start_artist_id = Artist.first.id
end_artist_id = Artist.last.id

#seeding artwork

i = 0

9.times do
art = Artwork.create!(gallery_id: [gallery1.id, gallery2.id].sample, exhibition_id: [exhibition1.id, exhibition2.id].sample, artist_id: rand(start_artist_id..end_artist_id),
                      name: Faker::Ancient.hero, description: Faker::Lorem.paragraph, dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
art.year = rand(art.artist.birth_date..art.artist.death_date).year
art.save

photo = ArtPhoto.new(artwork_id: art.id)
photo.remote_photo_url = artwork_photos[i]
i += 1
photo.save
3.times do
  JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
end
end



puts "Seed Completed"
