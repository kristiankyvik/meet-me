FactoryGirl.define do
  factory :location do
    name "Barna"
    city "Barcelona"
    zip_code "08035"
    association :visit
  end
end