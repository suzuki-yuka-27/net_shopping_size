FactoryBot.define do
  factory :hat do
    head_circumference { "20" }
    association :user
  end
end