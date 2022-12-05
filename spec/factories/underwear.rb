FactoryBot.define do
  factory :underwear do
    top_bust { "20" }
    under_bust { "20" }
    waist { "20" }
    hip { "20" }
    association :user
  end
end