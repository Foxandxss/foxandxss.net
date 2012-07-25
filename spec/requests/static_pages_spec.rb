require 'spec_helper'

describe "Static pages" do

  let!(:page_title) { FactoryGirl.create(:option, name: "page_name", value: "Page Title") }

  subject { page }

  describe "navbar" do

    let(:pt_projects) { FactoryGirl.create(:page_type, name: "Projects") }
    let(:pt_books) { FactoryGirl.create(:page_type, name: "Books") }
    let(:pt_about) { FactoryGirl.create(:page_type, name: "About") }
    let!(:projects) { FactoryGirl.create_list(:page, 3, ptype: pt_projects) }
    let!(:books) { FactoryGirl.create_list(:page, 3, ptype: pt_books) }
    let!(:about) { FactoryGirl.create(:page, title: "About Me", ptype: pt_about) }

    let(:status_active) { FactoryGirl.create(:blog_status, name: "active", color: "green") }
    let(:status_deprecated) { FactoryGirl.create(:blog_status, name: "deprecated", color: "red") }
    let!(:active_blogs) { FactoryGirl.create_list(:blog, 2, status: status_active) }
    let!(:deprecated_blog) { FactoryGirl.create(:blog, status: status_deprecated) }

    before do
      visit root_path
    end

    context "Brand" do

      it "should contain page title" do
        should have_content page_title.value
      end

      context "No brand" do
        let!(:page_title) { nil }

        it "should contain a default title if there is no brand" do
          should have_content "Page title"
        end
      end


    end

    context "Link to pages" do

      it "should contain page_links to projects" do
        should have_selector "a", text: "Projects"
        projects.each do |project|
          should have_selector "li", text: project.title
        end
      end

      it "should contain page_links to books" do
        should have_selector "a", text: "Books"
        books.each do |book|
          should have_selector "li", text: book.title
        end
      end
    end

    context "Link to blogs" do

      it "should contain active blogs" do
        active_blogs.each do |blog|
          should have_selector ".blog-active", text: blog.name
        end
      end

      it "should contain deprecated blogs" do
        should have_selector ".blog-deprecated", text: deprecated_blog.name
      end
    end

    it "Should show the About page" do
      should have_content about.title
    end
  end

  describe "Sidebar" do

    let!(:so_widget) { FactoryGirl.create(:widget, title: "Stackoverflow profile", content: '<a href="http://stackoverflow.com/users/123204/jesus-rodriguez">
<img src="http://stackoverflow.com/users/flair/123204.png" width="208" height="58" alt="profile for Jesus Rodriguez at Stack Overflow, Q&amp;A for professional and enthusiast programmers" title="profile for Jesus Rodriguez at Stack Overflow, Q&amp;A for professional and enthusiast programmers">
</a>
') }

    before do
      visit root_path
    end

    it "should contain the widgets" do
      should have_content so_widget.title
    end
  end

  describe "Home page" do

    context "Latest news" do

      let!(:news) { FactoryGirl.create_list(:news, 5) }
      let!(:old_news) { FactoryGirl.create_list(:news, 3, created_at: 3.days.ago) }

      before do
        visit root_path
      end

      it "contains the list of news" do
        news.each do |a_new|
          should have_content a_new.title
          should have_content a_new.content
        end
      end

      it "should not contain old news" do
        old_news.each do |a_new|
          should_not have_content a_new.title
          should_not have_content a_new.content
        end
      end

      context "Pagination" do

        before do
          click_link "Next"
        end

        it "contains only the old news" do
          old_news.each do |a_new|
            should have_content a_new.title
            should have_content a_new.content
          end

          news.each do |a_new|
            should_not have_content a_new.title
            should_not have_content a_new.content
          end
        end
      end
    end
  end
end
