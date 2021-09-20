FactoryBot.define do
  factory :dmroom do

     trait :invalid do
      id { "nil" }
    end
  end
end