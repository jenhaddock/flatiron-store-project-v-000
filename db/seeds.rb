10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create([
  {:email => "IamJoe@gmail.com", :password => "passw0rd"},
  {:email => "IamSteven@gmail.com", :password => "passw0rd"},
  {:email => "IamCourtney@gmail.com", :password => "passw0rd"},
  {:email => "IamMonica@gmail.com", :password => "passw0rd"}
  ])
