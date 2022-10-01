FactoryBot.define do
  factory :order_form do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    

    post_code          {'123-4567'}
    delivery_area_id   {2}
    city               {'川越市'}
    address            {'3-10-20'}
    tell               {'09012345678'}
    building           {'リブリ'}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end