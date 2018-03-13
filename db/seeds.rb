Warehouse.destroy_all
User.destroy_all

user1 = User.create(email: "userfirst@gmail.com", password: "motdepasse")
user2 = User.create(email: "usersecond@gmail.com", password: "motdepasse")
user3 = User.create(email: "userthird@gmail.com", password: "motdepasse")

user1.remote_photo_url = "https://res.cloudinary.com/dixy9tipv/image/upload/v1520958309/wozlfc0ypqwwsi9npaia.png"
user2.remote_photo_url = "https://res.cloudinary.com/dixy9tipv/image/upload/v1520958292/iiadhxkv2z6f3xypw92v.jpg"
user3.remote_photo_url = "https://res.cloudinary.com/dixy9tipv/image/upload/v1520958275/zdoeone2bug1s2v6dgn1.png"

user1.save
user2.save
user3.save

urls = ["https://res.cloudinary.com/dixy9tipv/image/upload/v1520960396/mahadjnu4wzx0jzteyph.jpg",
"https://res.cloudinary.com/dixy9tipv/image/upload/v1520960395/kw3yhll0voa2migquueb.jpg",
"https://res.cloudinary.com/dixy9tipv/image/upload/v1520960394/xzkfmly7sano2b3ofz8s.jpg"
]

 20.times do
  args_hash = {
    address: Faker::Address.street_address + ', ' + Faker::Address.city,
    surface: rand(100..500),
    pallets: rand(30..200),
    description: Faker::Lorem.paragraph(6),
    public_price: rand(500..1500),
    food_grade_certified: [true, false].sample,
    alcohol_certified: [true, false].sample,
    frozen_certified: [true, false].sample,
    transportation_services: [true, false].sample,
    fulfillment_services: [true, false].sample,
    devanning_services: [true, false].sample,
  }

  warehouse = Warehouse.new(args_hash)
  warehouse.user = [user1, user2, user3].sample
  warehouse.remote_photo_url = urls.sample
  warehouse.save

 end
