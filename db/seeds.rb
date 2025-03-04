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
# require 'faker'
# Faker::Config.locale = 'fr' # to have a french cellphone number

# 1. we create fake artisans/users (because a product belongs to a user)
puts "creating 10 fake artisans"
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name.downcase}.#{last_name.downcase}@artisan.fr"

  artisan = User.create(
    first_name: first_name,
    last_name: last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    user_type: "artisan",
    email: email,
    encrypted_password: "xxx"
  )
  puts "user #{first_name.downcase}.#{last_name.downcase} created"

  # 2. we create fake products /!\ the model product must be created
  puts "creation des produits de cet artisan"
  5.times do
    artisan_id = artisan.id
    quantity = (1..5)
    Product.create(
      artisan_id: artisan_id,
      name: Faker::Book.title,
      stock_quantity: quantity,
      adress: "107 Cr Balguerie Stuttenberg, 33300 Bordeaux",
      description: Faker::Quote.yoda,
      price: (0..200)
    )
    puts "5 products created!"
  end
end
puts "you have created 10 fake artisans with 5 for products each"
