require 'faker'

Option.create!(name: "page_name", value: "Foxandxss'")

projects = PageType.create!(name: "Projects")
books = PageType.create!(name: "Books")

Page.create!(title: "Project 1", ptype: projects, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "Project 2", ptype: projects, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "Project 3", ptype: projects, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "Project 4", ptype: projects, content: Faker::Lorem.paragraphs(5))

Page.create!(title: "My book 1", ptype: books, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "My book 2", ptype: books, content: Faker::Lorem.paragraphs(5))