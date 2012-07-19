require 'faker'

Option.delete_all
Page.delete_all
PageType.delete_all
Blog.delete_all
BlogStatus.delete_all
PageInformation.delete_all
PageLink.delete_all
News.delete_all

Option.create!(name: "page_name", value: "Foxandxss'")

projects = PageType.create!(name: "Projects")
books = PageType.create!(name: "Books")
about = PageType.create!(name: "About")

page = Page.create!(title: "Project 1", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")
Page.create!(title: "Project 2", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")
Page.create!(title: "Project 3", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")
Page.create!(title: "Project 4", ptype: projects, content: Faker::Lorem.paragraphs(5), image: "http://placekitten.com/g/400/400")

book = Page.create!(title: "My book 1", ptype: books, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "My book 2", ptype: books, content: Faker::Lorem.paragraphs(5))

Page.create!(title: "About Me", ptype: about, content: Faker::Lorem.paragraphs(5))

active = BlogStatus.create!(name: "active", color: "green")
deprecated = BlogStatus.create!(name: "deprecated", color: "red")

Blog.create!(name: "Active 1", status: active, url: "http://www.google.com")
Blog.create!(name: "Active 2", status: active, url: "http://www.google.com")
Blog.create!(name: "Deprecated 1", status: deprecated, url: "http://www.google.com")

PageInformation.create!(title: "Language", content: "Rails", page: page)
PageInformation.create!(title: "Info 2", content: "Rails", page: page)
PageInformation.create!(title: "Info 3", content: "Rails", page: page)
PageInformation.create!(title: "Info 4", content: "Rails", page: page)

PageLink.create!(title: "Github repo", url: "http://www.google.com", page: page)
PageLink.create!(title: "Live url", url: "http://www.google.com", page: page)

PageInformation.create!(title: "Technology", content: "Rails", page: book)
PageInformation.create!(title: "Pages", content: "111", page: book)
PageInformation.create!(title: "Publisher", content: "Self published.", page: book)

PageLink.create!(title: "Buy", url: "http://www.google.com", page: book)
PageLink.create!(title: "PDF", url: "http://www.google.com", page: book)

n1 = News.create!(title: "Welcome to my page", content: Faker::Lorem.paragraphs(3))
n2 = News.create!(title: "Woorking", content: Faker::Lorem.paragraphs(3))
n3 = News.create!(title: "Last update!", content: Faker::Lorem.paragraphs(3))

n1.created_at = 3.days.ago
n1.save!
n2.created_at = 1.day.ago
n2.save!
n3.created_at = 1.second.ago
n3.save!