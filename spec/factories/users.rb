FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'kkk000'}
    password_confirmation {password}
    first_name            { '浦田' }
    last_name             { '完' }
    first_name_kana       { 'ウラタ' }
    last_name_kana        { 'カン' }
    birthday              {'1996-04-29'}
  end
end