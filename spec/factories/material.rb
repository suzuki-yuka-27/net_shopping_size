FactoryBot.define do
  factory :material do
    name { Faker::JapaneseMedia::OnePiece.character }
    description { Faker::JapaneseMedia::OnePiece.quote }
    material_image { "/spec/fixtures/sample_image.png" }
    association :user
  end
end