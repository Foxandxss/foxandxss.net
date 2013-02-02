require "spec_helper"

describe ContactMailer do
  describe "contact_form" do
    let!(:contact) { FactoryGirl.create(:contact) }
    let(:mail) { ContactMailer.contact_form(contact) }


    it "renders the headers" do
      mail.subject.should eq("You got a message from Foxandxss.net")
      mail.to.should eq([contact.email])
    end

    it "renders the body" do
      mail.body.encoded.should match contact.message
    end
  end

end
