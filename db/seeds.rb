# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


counties = JSON.parse("[{\"name\":\"Mombasa\",\"code\":1},{\"name\":\"Kwale\",\"code\":2},{\"name\":\"Kilifi\",\"code\":3},{\"name\":\"Tana River\",\"code\":4},{\"name\":\"Lamu\",\"code\":5},{\"name\":\"Taita-Taveta\",\"code\":6},{\"name\":\"Garissa\",\"code\":7},{\"name\":\"Wajir\",\"code\":8},{\"name\":\"Mandera\",\"code\":9},{\"name\":\"Marsabit\",\"code\":10},{\"name\":\"Isiolo\",\"code\":11},{\"name\":\"Meru\",\"code\":12},{\"name\":\"Tharaka-Nithi\",\"code\":13},{\"name\":\"Embu\",\"code\":14},{\"name\":\"Kitui\",\"code\":15},{\"name\":\"Machakos\",\"code\":16},{\"name\":\"Makueni\",\"code\":17},{\"name\":\"Nyandarua\",\"code\":18},{\"name\":\"Nyeri\",\"code\":19},{\"name\":\"Kirinyaga\",\"code\":20},{\"name\":\"Murang'a\",\"code\":21},{\"name\":\"Kiambu\",\"code\":22},{\"name\":\"Turkana\",\"code\":23},{\"name\":\"West Pokot\",\"code\":24},{\"name\":\"Samburu\",\"code\":25},{\"name\":\"Trans-Nzoia\",\"code\":26},{\"name\":\"Uasin Gishu\",\"code\":27},{\"name\":\"Elgeyo-Marakwet\",\"code\":28},{\"name\":\"Nandi\",\"code\":29},{\"name\":\"Baringo\",\"code\":30},{\"name\":\"Laikipia\",\"code\":31},{\"name\":\"Nakuru\",\"code\":32},{\"name\":\"Narok\",\"code\":33},{\"name\":\"Kajiado\",\"code\":34},{\"name\":\"Kericho\",\"code\":35},{\"name\":\"Bomet\",\"code\":36},{\"name\":\"Kakamega\",\"code\":37},{\"name\":\"Vihiga\",\"code\":38},{\"name\":\"Bungoma\",\"code\":39},{\"name\":\"Busia\",\"code\":40},{\"name\":\"Siaya\",\"code\":41},{\"name\":\"Kisumu\",\"code\":42},{\"name\":\"Homa Bay\",\"code\":43},{\"name\":\"Migori\",\"code\":44},{\"name\":\"Kisii\",\"code\":45},{\"name\":\"Nyamira\",\"code\":46},{\"name\":\"Nairobi\",\"code\":47}]")



Role.create!(name: :County_Admin, resource_type: User)
Role.create!(name: :Department_Admin, resource_type: User)
Role.create!(name: :System_Admin, resource_type: User)

User.create!(email: "sam@sam.com", password: "samsam", password_confirmation: "samsam")

# User.all.add_role(:System_Admin)

# 3.times do
#   FiscalYear.create!(name: "#{rand(1950..2010).to_s + "-" + rand(2011..2050).to_s}", date_from: Faker::Date.forward(days: 1).to_datetime, date_to: Faker::Date.forward(days: 365).to_datetime)
# end
3.times do
  County.create!(counties.sample)
end

[
  "2021/22",
  "2020/21",
  "2019/20",
  "2018/19",
  "2017/18"
].each do |item|
  FiscalYear.create!({name:item, date_from: Faker::Date.forward(days: 1).to_datetime, date_to: Faker::Date.forward(days: 365).to_datetime})
end

[
  "Health",
  "Lands",
  "Trade",
  "Education, Sports & ICT",
  "Gender",
  "Transport",
  "Agriculture",
  "Water",
  "Finance",
  "GVN CS"
].each do | item|
  Department.create!({name: item, county_id: County.first.id})
end

[
  "National Government",
  "Local Revenue",
  "Exchequer",
  "Balance Brought Forward",
  "Conditional Grants"
].each do | item|
  RevenueSource.create!({name: item})
end