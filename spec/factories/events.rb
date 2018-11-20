# spec/factories/events.rb
FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    start_date { Faker::Date.between(Time.zone.today, 1.day.from_now) }
  end
end
