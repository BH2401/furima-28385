FactoryBot.define do
  factory :item do
    name {"aあ１22"}
    description {"aあ１22"}
    category_id {1}
    condition_id {1}
    postage_payer_id {1}
    prefecture_id {1}
    handling_time_id {1}
    price {22222}
    association :user

    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
