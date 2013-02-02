require 'spec_helper'

describe PageImage do

  context "Validations" do
    it "can have an image without title and content" do
      image = PageImage.new(asset: File.new(Rails.root.join('spec', 'fixtures', 'project1.png')))
      image.should be_valid
    end

    it "cannot have a title without content" do
      image = PageImage.new(asset: File.new(Rails.root.join('spec', 'fixtures', 'project1.png')), title: "Hello")
      image.should_not be_valid
    end

    it "cannot have a title with a blank content" do
      image = PageImage.new(asset: File.new(Rails.root.join('spec', 'fixtures', 'project1.png')), title: "Hello", content: "")
      image.should_not be_valid
    end

    it "cannot have content without a title" do
      image = PageImage.new(asset: File.new(Rails.root.join('spec', 'fixtures', 'project1.png')), content: "Hello")
      image.should_not be_valid
    end

    it "cannot have content with a  blank title" do
      image = PageImage.new(asset: File.new(Rails.root.join('spec', 'fixtures', 'project1.png')), content: "Hello", title: "")
      image.should_not be_valid
    end

    it "valid with url, title and content" do
      image = PageImage.new(asset: File.new(Rails.root.join('spec', 'fixtures', 'project1.png')), title: "for", content: "bar")
      image.should be_valid
    end
  end
end