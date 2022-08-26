FactoryBot.define do
  factory :room_message do
    message { Faker::Lorem.word }
    room { FactoryBot.create(:room) }
    user { FactoryBot.create(:user) }
  end
end
