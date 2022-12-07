FactoryBot.define do
  factory :one_piece do
    neck { "20" }
    shoulder_width { "20" }
    bust { "20" }
    waist { "20" }
    hip { "20" }
    body_length { "20" }
    sleeve_length { "20" }
    sleeve_width { "20" }
    association :user
  end
end