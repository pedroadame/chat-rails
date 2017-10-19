FactoryGirl.define do
  factory :room do
    name { Faker::Lorem.unique.sentence }

    factory :room_with_messages do
      after(:build) do |room|
        room.messages = build_list(:message, 40, room: room)
      end
    end
  end
end
