FactoryGirl.define do

  factory :option do
    name "name"
    value "value"
  end

  factory :page do
    sequence(:title) { |n| "Page #{n}" }
    association :ptype, factory: :page_type
    image "/spec/fixtures/project.png"
    content { Faker::Lorem.paragraphs(5).join('\n') }
  end

  factory :page_type do
    sequence(:name) { |n| "Type #{n}" }
  end

  factory :blog do
    sequence(:name) { |n| "Blog #{n}" }
    url "http://www.google.com"
    association :status, factory: :blog_status
  end

  factory :blog_status do
    name { Faker::Lorem.words(1).join('')}
    color "#000"
  end
end