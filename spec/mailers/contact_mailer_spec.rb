require "spec_helper"

describe ContactMailer do
  describe "contact_form" do
    let(:mail) { ContactMailer.contact_form }
    let!(:contact) { FactoryGirl.create(:contact) }

    it "renders the headers" do
      mail.subject.should eq("Contact form")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
