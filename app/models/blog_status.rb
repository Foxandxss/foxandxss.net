class BlogStatus < ActiveRecord::Base
  attr_accessible :color, :name, :blogs

  has_many :blogs
end
