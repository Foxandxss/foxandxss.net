require 'spec_helper'

describe PageLink do

  it "should add http in the url if doesn't exist" do
    link = PageLink.create!(title: "title", url: "www.google.com")
    link.url.should eql("http://www.google.com")
  end

  it "should not add http in the url if it exist" do
    link = PageLink.create!(title: "title", url: "http://www.google.com")
    link.url.should eql("http://www.google.com")
  end

  it "should not add http in the url if there is a https" do
    link = PageLink.create!(title: "title", url: "https://www.google.com")
    link.url.should eql("https://www.google.com")
  end
end