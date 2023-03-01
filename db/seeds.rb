UserType.create(name: 'SystemAdmin')
UserType.create(name: 'CountyAdmin')
UserType.create(name: 'DepartmentAdmin')
counties = JSON.parse("[{\"name\":\"Mombasa\",\"code\":1},{\"name\":\"Kwale\",\"code\":2},{\"name\":\"Kilifi\",\"code\":3},{\"name\":\"Tana River\",\"code\":4},{\"name\":\"Lamu\",\"code\":5},{\"name\":\"Taita-Taveta\",\"code\":6},{\"name\":\"Garissa\",\"code\":7},{\"name\":\"Wajir\",\"code\":8},{\"name\":\"Mandera\",\"code\":9},{\"name\":\"Marsabit\",\"code\":10},{\"name\":\"Isiolo\",\"code\":11},{\"name\":\"Meru\",\"code\":12},{\"name\":\"Tharaka-Nithi\",\"code\":13},{\"name\":\"Embu\",\"code\":14},{\"name\":\"Kitui\",\"code\":15},{\"name\":\"Machakos\",\"code\":16},{\"name\":\"Makueni\",\"code\":17},{\"name\":\"Nyandarua\",\"code\":18},{\"name\":\"Nyeri\",\"code\":19},{\"name\":\"Kirinyaga\",\"code\":20},{\"name\":\"Murang'a\",\"code\":21},{\"name\":\"Kiambu\",\"code\":22},{\"name\":\"Turkana\",\"code\":23},{\"name\":\"West Pokot\",\"code\":24},{\"name\":\"Samburu\",\"code\":25},{\"name\":\"Trans-Nzoia\",\"code\":26},{\"name\":\"Uasin Gishu\",\"code\":27},{\"name\":\"Elgeyo-Marakwet\",\"code\":28},{\"name\":\"Nandi\",\"code\":29},{\"name\":\"Baringo\",\"code\":30},{\"name\":\"Laikipia\",\"code\":31},{\"name\":\"Nakuru\",\"code\":32},{\"name\":\"Narok\",\"code\":33},{\"name\":\"Kajiado\",\"code\":34},{\"name\":\"Kericho\",\"code\":35},{\"name\":\"Bomet\",\"code\":36},{\"name\":\"Kakamega\",\"code\":37},{\"name\":\"Vihiga\",\"code\":38},{\"name\":\"Bungoma\",\"code\":39},{\"name\":\"Busia\",\"code\":40},{\"name\":\"Siaya\",\"code\":41},{\"name\":\"Kisumu\",\"code\":42},{\"name\":\"Homa Bay\",\"code\":43},{\"name\":\"Migori\",\"code\":44},{\"name\":\"Kisii\",\"code\":45},{\"name\":\"Nyamira\",\"code\":46},{\"name\":\"Nairobi\",\"code\":47}]")

counties[1..10].each do |item|
  County.create!(item)
end

%w[2022-2023 2023-2024].each do |item|
  FiscalYear.create!({ name: item, date_from: Faker::Date.forward(days: 1).to_datetime,
                       date_to: Faker::Date.forward(days: 365).to_datetime })
end

[
  'National Government',
  'Local Revenue',
  'Exchequer',
  'Balance Brought Forward',
  'Conditional Grants'
].each do |item|
  RevenueSource.create!({ name: item })
end

projects = []
County.all.each do |county|
  CountyBudget.create!({ "fiscal_year_id": 1, "county_id": county.id, "totalBudget": rand(1_000_000..9_999_999) })

  rand(5..10).times do |_item|
    department = Department.create(county_id: county.id,
                                   name: "#{county.name} - #{Faker::Artist.name} Department - #{rand(0..5656)}", totalBudget: rand(1_000_000..9_999_999).to_d, developmentBudget: rand(1_000_000..9_999_999).to_d, recurrentBudget: rand(1_000_000..9_999_999).to_d, pendingBills: rand(1_000_000..9_999_999).to_d)
    rand(1..5).times do |_proj|
      dept = department.projects.new(title: "#{Faker::Movies::StarWars.character} Project #{rand(999..1_009_992)}",
                                     description: Faker::Quote.famous_last_words, revenue_source_id: rand(1..3), department_id: Department.last.id, ward: Faker::Address.state, location: Faker::Address.state, status: %w[New OnGoing Complete Paused].sample, budgetAmount: rand(1_000_000..9_999_999).to_d, spentAmount: rand(100_000..500_000).to_d, fiscal_year_id: 1)
      projects.push(dept)
    end
  end
end
Project.import(projects)

User.create!(email: 'user@user.com', password: 'useruser', password_confirmation: 'useruser', county_id: 1, department_id: 1,
             user_type_id: 1)

puts "Elapsed time is #{elapsed.real} seconds"
