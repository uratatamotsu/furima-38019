FactoryBot.define do
  factory :item do
    association :user
    
    exhibits_name      {'ノート'}
    exhibits_text      {'色々書ける'}
    money              {500}
    category_id        {2}
    situation_id       {2}
    shipping_cost_id   {2}
    delivery_area_id   {2}
    shipping_days_id   {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end