FactoryBot.define do
  factory :bottom do
    sequence(:waist, 50)
    sequence(:hip, 50)
    sequence(:rising_length, 50)
    sequence(:inseam, 50)
    sequence(:total_length, 50)
    sequence(:thickness_of_thigh, 50)
    sequence(:bottom_width, 50)
    association :user
  end
end