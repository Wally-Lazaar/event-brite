require 'faker'

#Destroy seeds
Attender.destroy_all
Event.destroy_all
User.destroy_all

i = 0

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: "a#{i}@yopmail.com",
    password: "aaaaaa"
  );
  i = i + 1
end


10.times do
  event = Event.create!(
    start_date: Faker::Date.between(from: '2022-03-23', to: '2025-09-25'),
    duration: 15,
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::ChuckNorris.fact,
    price: 5,
    location: Faker::Games::HalfLife.location,
    
    
  )
end

10.times do
  attender = Attender.create!(
    event_id: Event.all.sample.id,
    user_id: User.all.sample.id
  )
end
