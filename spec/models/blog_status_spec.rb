require 'spec_helper'

describe BlogStatus do

  it "should append a # to the color if doesn't exist" do
    status = BlogStatus.create!(name: "name", color: "fff")
    status.color.should eql("#fff")
  end

  it "should not append a # if there is one already" do
    status = BlogStatus.create!(name: "name", color: "#fff")
    status.color.should eql("#fff")
  end
end