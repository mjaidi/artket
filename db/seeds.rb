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
user1 = User.create!(first_name: "Majid", last_name: "Jaidi", email: "majid@gmail.com", password: "123456789")
user2 = User.create!(first_name: "Yasmina", last_name: "Hannaoui", email: "yas@gmail.com", password: "123456789")

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
gallery1 = Gallery.create!(user_id: user2.id, name: "Artket", description: Faker::Lorem.paragraph(2, false, 6), address_line: "Jemaa El Fna", city: "Marrakesh",country: "Morocco", email: "artket@artket.ma", phone: "0522625545")
gallery1.remote_photo_url = gallery_photos[0]
gallery1.save
gallery2 = Gallery.create!(user_id: user1.id, name: "Thema", description: Faker::Lorem.paragraph(2, false, 6),  address_line: "Maarif", city: "Casablanca",country: "Morocco", email: "thema@thema.ma", phone: "0524512548" )
gallery2.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536584377/thema-casablanca-maroc.jpg"
gallery2.save

#seeding Exhibitions
exhibition1 = Exhibition.create!(gallery_id: gallery1.id, name: "Artket Peinture", description: Faker::Lorem.paragraph(2, false, 6), start_date: (now - 10), end_date: (now + 50))
exhibition1.remote_cover_photo_url = exhibition_photos[0]
exhibition1.save
exhibition2 = Exhibition.create!(gallery_id: gallery2.id, name: "Thema Photographie", description: Faker::Lorem.paragraph(2, false, 6), start_date: (now + 15), end_date: (now + 95))
exhibition2.remote_cover_photo_url = exhibition_photos[1]
exhibition2.save

#seeding artists
  artist1 = Artist.create!(first_name: "Amparo", last_name: "Cruz Herrera", description: "Fille du célèbre peintre José Cruz Herrera Linense", birth_date: Date.new(1926,10,4), death_date: Date.new(2003,11,12), user_id: user1.id)
  artist1.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536570709/amparo_cruz_herrera.jpg"
  artist1.save
#seeding artists
  artist2 = Artist.create!(first_name: "Hassan", last_name: "El Glaoui", description: "Peintre marocain formé à l'Académie des Beaux Arts de Paris", birth_date: Date.new(1924,9,4), death_date: Date.new(2003,11,12), user_id: user1.id)
  artist2.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536571162/5f0765_e61c308dd68331de983a39a5328d2bc8.jpg"
  artist2.save
#seeding artists
  artist3 = Artist.create!(first_name: "Chaïbia", last_name: "Tallal", description: "Peintre marocaine, pionniraire du style brut", birth_date: Date.new(1929,10,4), death_date: Date.new(2004,11,12), user_id: user1.id)
  artist3.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536571879/Capture_d_e%CC%81cran_2018-09-10_a%CC%80_10.31.00.png"
  artist3.save
#seeding artists
  artist4 = Artist.create!(first_name: "Saad", last_name: "Ben Cheffaj", description: "Artiste multidisciplinaire qui allie peinture et poésie", birth_date: Date.new(1939,10,4), death_date: Date.new(2003,11,12), user_id: user1.id)
  artist4.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536573238/Capture_d_e%CC%81cran_2018-09-10_a%CC%80_10.53.30.png"
  artist4.save
#seeding artists
  artist5 = Artist.create!(first_name: "Shepard", last_name: "Fairey", description: "Artiste américain, sérigraphe, muraliste et illustrateur", birth_date: Date.new(1970,10,4), death_date: Date.new(2003,11,12), user_id: user2.id)
  artist5.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536573488/Shepard-Fairey-featured-555x312.jpg"
  artist5.save
#seeding artists
  artist6 = Artist.create!(first_name: "Richard", last_name: "Mirando", description: "Alias Seen, reconnu comme le parain du graffiti", birth_date: Date.new(1961,10,4), death_date: Date.new(2003,11,12), user_id: user2.id)
  artist6.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536574052/Seen_Kool.jpg"
  artist6.save
#seeding artists
  artist7 = Artist.create!(first_name: "Hussein", last_name: "Tallal", description: "Artiste autodidacte", birth_date: Date.new(1961,10,4), death_date: Date.new(2003,11,12), user_id: user2.id)
  artist7.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536578326/Capture_d_e%CC%81cran_2018-09-10_a%CC%80_12.18.33.png"
  artist7.save
#seeding artists
  artist8 = Artist.create!(first_name: "Choukri", last_name: "Regragui", description: "Génie du réalisme pictural", birth_date: Date.new(1961,10,4), death_date: Date.new(2003,11,12), user_id: user2.id)
  artist8.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536579111/Choukri-Regragui-.jpg"
  artist8.save
#seeding artists
  artist9 = Artist.create!(first_name: "Abderrahim", last_name: "Iqbi", description: "Artiste tragique", birth_date: Date.new(1961,10,4), death_date: Date.new(2003,11,12), user_id: user2.id)
  artist9.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536579806/abderrahim_iqbi_nb.jpg"
  artist9.save
#seeding artists
  artist10 = Artist.create!(first_name: "Nabil", last_name: "Boudarqa", description: "Artiste tragique", birth_date: Date.new(1961,10,4), death_date: Date.new(2003,11,12), user_id: user2.id)
  artist10.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536580099/articlesprincipaleskf3a8337.jpg"
  artist10.save
#seeding artists
  artist11 = Artist.create!(first_name: "Youssef", last_name: "Douieb", description: "Artiste moderne", birth_date: Date.new(1961,10,4), death_date: Date.new(2003,11,12), user_id: user1.id)
  artist11.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536582137/249862_portrait_image.jpg"
  artist11.save
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist1.id,
                        name: "Sans titre", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536569821/S2.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist2.id,
                        name: "Sans titre", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536523903/F1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist2.id,
                        name: "Portrait jeune homme", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536571372/J1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist2.id,
                        name: "Nature morte", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536571522/T2.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist3.id,
                        name: "Sans titre", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536572495/chaibia-talal-sans-titre.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist3.id,
                        name: "Composition", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536531694/Y1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist3.id,
                        name: "Sans titre", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536523028/B1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist3.id,
                        name: "Sans titre", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536572685/chaibia-talal-sans-titre-1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist3.id,
                        name: "Sans titre", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536572720/chaibia-talal-sans-titre-2.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist4.id,
                        name: "Sans titre", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536523090/A1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist5.id,
                        name: "Deception and disorder", description: "Sérigraphie signée", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536573488/09dcc100-cb06-4944-bf48-3da6676da403.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist5.id,
                        name: "Deception and disorder", description: "Sérigraphie signée", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536573488/usap_shepard_fairey_deception--disorder_print.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist5.id,
                        name: "Make art not war", description: "Sérigraphie signée", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536573813/Make_Art_Not_War_24x36_offset-01_1024x1024.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist5.id,
                        name: "Dark Wave", description: "Sérigraphie signée", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536573871/Dark-Wave-canvas_24X36-01_1024x1024.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist6.id,
                        name: "Large multi tags", description: "Aerosol sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536573992/78d75a9c-90ad-4215-a269-5221247c41aa.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist7.id,
                        name: "Portrait", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536577688/Ta1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist7.id,
                        name: "Portrait", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536577701/Ta2.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist7.id,
                        name: "Portrait", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536578065/IMG_3136.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist7.id,
                        name: "Composition", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536578611/C1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist8.id,
                        name: "Portrait d'une jeune fille", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536577712/O1.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist4.id,
                        name: "Composition", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536578111/BC.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist9.id,
                        name: "Oiseau", description: "Huile sur toile", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536578133/IMG_3129.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery1.id, exhibition_id: exhibition1.id, artist_id: artist10.id,
                        name: "Oiseau", description: "Vanité", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536578132/IMG_3133.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist11.id,
                        name: "Composition", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536582137/youssef_douieb3lr.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist11.id,
                        name: "Composition", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536582138/8271796_image.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist11.id,
                        name: "Composition", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536582138/thema-galerie-youssef-douieb-2-big.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist11.id,
                        name: "Composition", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536582141/680992257582-1472805181jkiM2O_700x515_680992257582-1472805181jkiM2O.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
#seeding artwork
  art = Artwork.create!(gallery_id: gallery2.id, exhibition_id: exhibition2.id, artist_id: artist11.id,
                        name: "Composition", description: "Gouache sur papier", dimensions: "#{rand(50..5000)}mm x #{rand(50..5000)}mm", price: rand(1000..50000))
  art.year = rand(art.artist.birth_date..art.artist.death_date).year
  art.save

  photo = ArtPhoto.new(artwork_id: art.id)
  photo.remote_photo_url = "https://res.cloudinary.com/artket/image/upload/v1536582142/lot_54_2.jpg"
  photo.save

  3.times do
    JoinArtCategory.create!(artwork_id: art.id, category_id: rand(start_categories_id..end_categories_id))
  end
puts "Seed Completed"
