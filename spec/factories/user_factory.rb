FactoryGirl.define do
  factory :user do
    user_name "Jordi98"
    name "Jordi"
    nationality "Spanish"
    factory :invalid_user do
      user_name nil
    end
  end
end

