FactoryBot.define do
  factory :top do
    neck { "20" }
    shoulder_width { "20" }
    body_width { "20" }
    body_length { "20" }
    sleeve_length { "20" }
    sleeve_width { "20" }
    association :user
  end
end