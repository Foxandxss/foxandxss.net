require 'spec_helper'

describe "Page pages" do

  subject { page }

  describe "Show page" do

    let!(:page_title) { FactoryGirl.create(:option, name: "page_name", value: "Page Title") }
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

    context "Page extras" do

      context "Images" do

        let!(:images) { FactoryGirl.create_list(:page_image, 3, page: project) }

        before do
          visit page_path project
        end

        it "should contain all images (carousel)" do
          images.each do |image|
            should have_xpath("//img[@src=\"#{image.url}\"]")
          end
        end
      end

      context "Page information" do

        let!(:infos) { FactoryGirl.create_list(:page_information, 5, page: project) }

        before do
          visit page_path project
        end

        it "should contain all that info" do
          infos.each do |info|
            should have_selector "p", text: info.title
            should have_selector "span", text: info.content
          end
        end
      end

      context "Page page_links" do

        let!(:page_links) { FactoryGirl.create_list(:page_link, 3, page: project) }

        before do
          visit page_path project
        end

        it "should contain all page page_links" do
          page_links.each do |link|
            should have_selector "p", text: link.title
            should have_selector "a", text: link.url
          end
        end
      end
    end
  end
end
