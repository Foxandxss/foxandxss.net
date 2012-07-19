FactoryGirl.define do

  factory :option do
    name "name"
    value "value"
  end

  factory :news do
    sequence(:title) { |n| "News #{n}" }
    content { Faker::Lorem.paragraphs(3).join('\n') }
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

  factory :page_information do
    sequence(:title) { |n| "Information #{n}" }
    content { Faker::Lorem.sentence }
    page
  end

  factory :page_link do
    sequence(:title) { |n| "Link #{n}" }
    url "http://www.google.com"
    page
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