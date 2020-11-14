FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"陸太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"リクタロウ"}
    birth_date {'2020-11-13'}
  end
end
