require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "navbar" do

    let!(:page_title) { FactoryGirl.create(:option, name: "page_name", value: "Page Title") }
    let!(:pt_projects) { FactoryGirl.create(:page_type, name: "Projects") }
    let!(:pt_books) { FactoryGirl.create(:page_type, name: "Books") }
    let!(:projects) { FactoryGirl.create_list(:page, 3, ptype: pt_projects) }
    let!(:books) { FactoryGirl.create_list(:page, 3, ptype: pt_books) }

    before do
      visit root_path
    end

    it "should contain page title" do
      should have_content page_title.value
    end

    it "should contain links to projects" do
      should have_selector "a", text: "Projects"
      projects.each do |project|
        should have_selector "li", text: project.title
      end
    end

    it "should contain links to books" do
      should have_selector "a", text: "Books"
      books.each do |book|
        should have_selector "li", text: book.title
      end
    end
  end
end
