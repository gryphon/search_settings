FactoryGirl.define do
  factory :post do
    sequence(:name) { |n| "post#{n}" }
    association :category
  end

end
