FactoryGirl.define do

  factory :option do
    name "name"
    value "value"
  end

  factory :news do
    sequence(:title) { |n| "News #{n}" }
    #sequence(:image) { |n| File.new(Rails.root.join('spec', 'fixtures', "project#{n}.png")) }
    image File.new(Rails.root.join('spec', 'fixtures', "project1.png"))
    content { Faker::Lorem.paragraphs(3).join('\n') }
  end

  factory :page do
    sequence(:title) { |n| "Page #{n}" }
    association :category, factory: :page_category
    content { Faker::Lorem.paragraphs(5).join('\n') }
  end

  factory :page_category do
    sequence(:name) { |n| "Type #{n}" }
  end

  factory :page_image do
    sequence(:title) { |n| "Information #" }
    content { Faker::Lorem.paragraph }
    sequence(:asset) { |n| File.new(Rails.root.join('spec', 'fixtures', "project#{n}.png")) }
    #asset { paperclip_fixture('page_image', 'asset', 'png')} # Doesn't work yet, bugged it seems.
    page
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
    name { Faker::Lorem.words(1).join('') }
    color "#000"
  end

  factory :widget do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end

  factory :contact do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    message { Faker::Lorem.sentence }
    skip_create
  end
end