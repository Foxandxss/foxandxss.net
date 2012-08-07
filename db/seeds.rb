require 'faker'

Option.delete_all
Page.delete_all
PageCategory.delete_all
Blog.delete_all
BlogStatus.delete_all
PageInformation.delete_all
PageLink.delete_all
News.delete_all
Widget.delete_all
PageImage.delete_all
AdminUser.delete_all

Option.create!(name: "page_name", value: "Foxandxss'")
Option.create!(name: "page_footer", value: "Footer")

projects = PageCategory.create!(name: "Projects")
books = PageCategory.create!(name: "Books")
about = PageCategory.create!(name: "About")

page = Page.create!(title: "Project 1", category: projects, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "Project 2", category: projects, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "Project 3", category: projects, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "Project 4", category: projects, content: Faker::Lorem.paragraphs(5))

book = Page.create!(title: "My book 1", category: books, content: Faker::Lorem.paragraphs(5))
Page.create!(title: "My book 2", category: books, content: Faker::Lorem.paragraphs(5))

Page.create!(title: "About Me", category: about, content: Faker::Lorem.paragraphs(5))

active = BlogStatus.create!(name: "active", color: "#418528")
deprecated = BlogStatus.create!(name: "deprecated", color: "#F00")

Blog.create!(name: "Active 1", status: active, url: "http://www.google.com")
Blog.create!(name: "Active 2", status: active, url: "http://www.google.com")
Blog.create!(name: "Deprecated 1", status: deprecated, url: "http://www.google.com")

PageImage.create(title: "A kitten", content: "Black and white kitten", asset: URI.parse("http://placekitten.com/g/400/400"), page: page)
PageImage.create(title: "Another kitten", content: "Kitten kitten kitten", asset: URI.parse("http://placekitten.com/g/400/300"), page: page)
PageImage.create(asset: URI.parse("http://placekitten.com/g/300/400"), page: page)

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

News.create!(title: "Newer news", content: Faker::Lorem.paragraphs(3))
News.create!(title: "Newer news", content: Faker::Lorem.paragraphs(3))
News.create!(title: "Newer news", content: Faker::Lorem.paragraphs(3))
n1 = News.create!(title: "Welcome to my page", content: Faker::Lorem.paragraphs(3))
n2 = News.create!(title: "Woorking", content: Faker::Lorem.paragraphs(3))
n3 = News.create!(title: "Last update!", content: Faker::Lorem.paragraphs(3))

n1.created_at = 3.days.ago
n1.save!
n2.created_at = 1.day.ago
n2.save!
n3.created_at = 1.second.ago
n3.save!

Widget.create!(title: "Follow me!", content: '<a href="https://twitter.com/Foxandxss" class="twitter-follow-button" data-show-count="false" data-lang="es" data-size="large">Seguir a @Foxandxss</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>')
Widget.create!(title: "Stackoverflow profile", content: '<a href="http://stackoverflow.com/users/123204/jesus-rodriguez">
<img src="http://stackoverflow.com/users/flair/123204.png" width="208" height="58" alt="profile for Jesus Rodriguez at Stack Overflow, Q&amp;A for professional and enthusiast programmers" title="profile for Jesus Rodriguez at Stack Overflow, Q&amp;A for professional and enthusiast programmers">
</a>
')

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')