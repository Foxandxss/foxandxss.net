require 'faker'

Option.delete_all
Page.delete_all
PageType.delete_all
Blog.delete_all
BlogStatus.delete_all

Option.create!(name: "page_name", value: "Foxandxss'")

projects = PageType.create!(name: "Projects")
books = PageType.create!(name: "Books")

Page.create!(title: "Project 1", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")
Page.create!(title: "Project 2", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")
Page.create!(title: "Project 3", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")
Page.create!(title: "Project 4", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")

Page.create!(title: "My book 1", ptype: books, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "My book 2", ptype: books, content: Faker::Lorem.paragraphs(5))

active = BlogStatus.create!(name: "active", color: "green")
deprecated = BlogStatus.create!(name: "deprecated", color: "red")

Blog.create!(name: "Active 1", status: active, url: "http://www.google.com")
Blog.create!(name: "Active 2", status: active, url: "http://www.google.com")
Blog.create!(name: "Deprecated 1", status: deprecated, url: "http://www.google.com")