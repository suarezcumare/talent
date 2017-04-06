FactoryGirl.define do
  factory :city do
    name { Faker::StarWars.character }
    code { Faker::StarWars.character }
  end
end