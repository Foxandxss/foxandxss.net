require 'spec_helper'

describe "Page pages" do

  subject { page }

  let!(:page_title) { FactoryGirl.create(:option, name: "page_name", value: "Page Title") }

  describe "Show page" do

    let!(:project) { FactoryGirl.create(:page) }

    before do
      visit root_path
      click_link project.title
    end

    it "should contain the page name on title (also project type)" do
      should have_selector "title", text: "#{project.title} - #{project.ptype.name} - #{page_title.value}"
    end

    it "should contain all page content" do
      should have_content project.content
    end

    it "should contain the image" do
      save_and_open_page
      should have_xpath("//img[@src=\"#{project.image}\"]")
    end
  end
end
