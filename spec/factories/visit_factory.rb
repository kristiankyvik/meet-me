FactoryGirl.define do
  factory :visit do
    from_date DateTime.now + 1.week
    to_date DateTime.now + 4.week
  end
end 
