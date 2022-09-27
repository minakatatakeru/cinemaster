# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Movie.create(moviedata_id: 985939, movie_content: 'test', star: '4.0', customer_id: 1)

Customer.create!(name:  "管理者",
                 email: "example@railstutorial.org",
                 password:  "111111",
                 password_confirmation: "111111",
                 admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Customer.create!(name:  name,
                   email: email,
                   password:              password,
                   password_confirmation: password)
end