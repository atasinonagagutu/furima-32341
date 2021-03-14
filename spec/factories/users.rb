FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name            { '漢字ひらがなカタカナ' }
    first_name_kana       { 'カタカナ' }
    last_name             { '漢字ひらがなカタカナ' }
    last_name_kana        { 'カタカナ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2021-03-14') }
  end
end
