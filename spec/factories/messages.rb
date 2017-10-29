FactoryGirl.define do
  factory :message do
    room
    user { Faker::Internet.user_name }
    content { Faker::Lorem.paragraph }
  end
end
