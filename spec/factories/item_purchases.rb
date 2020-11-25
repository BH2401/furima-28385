FactoryBot.define do
  factory :item_purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '町田市' }
    area { '押立町5-38-9' }
    building_name { '東京ハイツ2-2-307' }
    phone_number { '09012345678' }
    association :user
    association :item
  end
end
