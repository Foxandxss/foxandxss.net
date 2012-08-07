class PageInformation < ActiveRecord::Base
  attr_accessible :content, :page, :title

  belongs_to :page
  validates :title, :content, presence: true
end
