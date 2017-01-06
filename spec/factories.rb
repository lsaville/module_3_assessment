FactoryGirl.define do
  factory :item do
    name Faker::Name.last_name
    description Faker::Hipster.sentence
    image_url Faker::Avatar.image
  end
end
