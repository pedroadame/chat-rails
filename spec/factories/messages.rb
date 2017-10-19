FactoryGirl.define do
  factory :message do
    user
    room
    content { Faker::Lorem.paragraph }
  end
end
