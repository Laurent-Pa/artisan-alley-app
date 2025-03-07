# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

### READ THIS IF YOU WANT TO ADD FAKE, USERS, PRODUCTS and ORDERS

# You must add gem faker to gemfile and run a bundle install

# Uncomment theses ligns according to want you want to create
require 'faker'
Faker::Config.locale = 'fr' # to have a french cellphone number

# 1. we create fake artisans/users (because a product belongs to a user)

# Fake adress at Bordeaux around le Wagon
FAKE_ADRESSES = [
  "41 Rue Borie, 33300 Bordeaux",
  "3 Cr Edouard Vaillant, 33300 Bordeaux",
  "15 Quai du Maroc, 33300 Bordeaux",
  "Place de Latule, Bd Alfred Daney, 33300 Bordeaux",
  "264 Bd Godard, 33300 Bordeaux",
  "260 Bd Godard, 33300 Bordeaux",
  "5 Quai du Maroc, 33300 Bordeaux",
  "115 Quai des Chartrons, 33000 Bordeaux",
  "39 Rue de la Course, 33000 Bordeaux",
  "3 Rue Guadet, 33000 Bordeaux",
  "48 rue Pompière, La Passerelle, 33110 Le Bouscat"
                ]

FAKE_PICS_ID = [
  "0ch9dvs4yfln3tj3a2f4m1wokm8i",
  "vpsjfnzuex4gpy5agauzwx5asjkc",
  "li248ijy3ekcafmupppwc14e5idb",
  "a0hr5xythemkohzso54p2sg6q982",
  "hgfarsujxjzv42112ivbt8wa5kre"
  ]

# puts "creating 3 fake artisans"
3.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@artisan.fr"

  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    user_type: "artisan",
    email: email,
    password: "123456"
  )
  puts "user #{first_name.downcase} #{last_name.downcase} created"


  # 2. we create fake products /!\ the model product must be created
  puts "creation des produits de cet artisan"
  5.times do
    Product.create!(
      user_id: user.id,
      name: "Joconde",
      stock_quantity: (1..5).to_a.sample,
      adress: FAKE_ADRESSES.sample,
      description: "oeuvre d'art",
      photo_id: FAKE_PICS_ID.sample,
      price: (0..200).to_a.sample
    )
  end
end
puts "you have created 10 fake artisans with 5 for products each"
