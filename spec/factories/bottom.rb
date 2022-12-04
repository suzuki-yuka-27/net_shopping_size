FactoryBot.define do
  factory :bottom do
    waist { "20" }
    hip { "20" }
    rising_length { "20" }
    inseam { "20" }
    total_length { "20" }
    thickness_of_thigh { "20" }
    bottom_width { "20" }
    association :user
  end
end