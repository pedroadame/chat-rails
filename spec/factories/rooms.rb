FactoryGirl.define do
  factory :room do
    name { Faker::Lorem.unique.sentence }
  end
end
