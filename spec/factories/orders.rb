FactoryBot.define do
  factory :order do
    postal_cord { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 10) }
    city { Faker::Lorem.sentence }
    address_line { '1-1' }
    building { Faker::Lorem.sentence }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
