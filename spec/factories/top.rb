FactoryBot.define do
  factory :top do
    sequence(:neck, 20)
    sequence(:shoulder_width, 20)
    sequence(:body_width, 20)
    sequence(:body_length, 20)
    sequence(:sleeve_length, 20)
    sequence(:sleeve_width, 20)
    association :user
  end
end