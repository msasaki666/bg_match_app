FactoryBot.define do
  factory :post do
    name { "MyString" }
    description { "MyText" }
    date { "2020-02-08 04:57:44" }
    address { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
