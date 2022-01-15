# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."

Goal.destroy_all
User.destroy_all

puts "Creating Users..."

david = User.create!(
  first_name: "David",
  last_name: "AJ Wong",
  email: "somethingwong@gmail.com",
  password: "123456",
  investment: rand(500..1000)
)
4.times do
  user = User.create!(
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    email: "#{Faker::Internet.email}",
    password: "dollar123",
    investment: rand(500..1000)
  )

  puts "Created User #{user.first_name} #{user.last_name}"
end

puts "Creating Goals..."
print User.last.id
user = david.id
5.times do
  sample_goals = ["Travel to Tuvalu", "Get a switch for isolation", "Not eat Maccas anymore -_-' "]
  count = 0
  3.times do
    goal = Goal.create!(
      title: "#{sample_goals[count]}",
      description: "#{Faker::Lorem.sentence(word_count: 8, supplemental: true, random_words_to_add: 7)}",
      amount: rand(200..500),
      recurring_investment: rand(20..50),
      date: Date.strptime("#{Faker::Date.between(from: '2022-06-01', to: '2027-06-01')}", "%Y-%m-%d"),
      user_id: user,
      archived: false
    )
    puts "Created Goal #{goal.title} for user ID #{user}"
    count += 1
  end
  user += 1
end

puts "Finished!"
