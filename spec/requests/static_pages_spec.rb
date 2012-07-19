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

  describe "Home page" do

    context "Latest news" do

      let!(:news) { FactoryGirl.create_list(:news, 4) }

      before do
        visit root_path
      end

      it "contains the list of news" do
        news.each do |a_new|
          should have_content a_new.title
          should have_content a_new.content
        end
      end
    end
  end
end
