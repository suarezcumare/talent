FactoryGirl.define do
  factory :temperature do
    temp { Faker::Number.decimal(2, 2)  }
    temp_min { Faker::Number.decimal(2, 2)  }
    temp_max { Faker::Number.decimal(2, 2)  }
    created_at { Time.now }
    association :city, factory: :city
  end
end