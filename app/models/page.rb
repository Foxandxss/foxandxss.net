class Page < ActiveRecord::Base
  attr_accessible :content, :image, :title, :ptype, :informations

  belongs_to :ptype, class_name: "PageType"
  has_many :informations, class_name: "PageInformation"
  has_many :links, class_name: "PageLink"
  has_many :images, class_name: "PageImage"
end
