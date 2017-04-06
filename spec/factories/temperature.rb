FactoryGirl.define do
  factory :temperature do
    temp { Faker::Number.decimal(2, 2)  }
    temp_min { Faker::Number.decimal(2, 2)  }
    temp_max { Faker::Number.decimal(2, 2)  }
    association :city, factory: :city
  end
end