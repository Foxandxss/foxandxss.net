class PageImage < ActiveRecord::Base
  attr_accessible :content, :page, :title, :url

  belongs_to :page
  validates :url, presence: true
  validates :title, presence: true, if: :content
  validates :content, presence: true, if: :title
end
