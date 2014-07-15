FactoryGirl.define do
  factory :relationship do
    user
    association :honey, factory: :user
  end
end