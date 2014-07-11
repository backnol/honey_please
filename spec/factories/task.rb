FactoryGirl.define do
  factory :task do
    title "Do the dishes"
    due_at  { Time.now + 1.hour }
    status :pending
    points 10
  end
end
