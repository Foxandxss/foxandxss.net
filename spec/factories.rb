FactoryGirl.define do

  factory :option do
    name "name"
    value "value"
  end

  factory :page do
    sequence(:title) { |n| "Page #{n}" }
    association :ptype, factory: :pagetype
    image "spec/fixtures/project.png"
    content { Faker::Lorem.paragraphs(5).join('\n') }
  end

  factory :page_type do
    sequence(:name) { |n| "Type #{n}" }
  end
end