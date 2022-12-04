FactoryBot.define do
  factory :ring do
    finger_circumference { "20" }
    association :user
  end
end