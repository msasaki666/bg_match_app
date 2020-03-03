FactoryBot.define do
  factory :post do
    name { "MyName" }
    description { "MyText" }
    date { "2020-02-08 04:57:44" }
    address { "MyAddress" }
    latitude { 1.5 }
    longitude { 1.5 }
    association :user
  end
end
