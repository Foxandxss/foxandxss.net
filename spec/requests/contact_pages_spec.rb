require 'spec_helper'

describe "Contact pages" do

  subject { page }

  context "with valid data" do

    before do
      visit root_path
      click_link "Contact me"
      fill_in "Name", with: "User"
      fill_in "Email", with: "user@example.com"
      fill_in "Message", with: "Hello, I like your page"
      click_button "Send"
    end

    it "shows an email sent message" do
      should have_content "Email has been sent."
    end
  end

  context "with invalid data" do
    before do
      visit new_contact_path
      click_button "Send"
    end

    # simple_form generates the errors without any space between the label and the error.
    it "shows an error message in every field" do
      should have_content "Namecan't be blank"
      should have_content "Emailcan't be blank"
      should have_content "Messagecan't be blank"
    end
  end
end