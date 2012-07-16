class Page < ActiveRecord::Base
  attr_accessible :content, :image, :title, :ptype

  belongs_to :ptype, class_name: "PageType"
end
