class PageImage < ActiveRecord::Base
  attr_accessible :content, :page, :title, :asset
  has_attached_file :asset ,styles: { large: "340x330", medium: "140x80>", thumb: "70x70>" }

  belongs_to :page
  validates :asset, attachment_presence: true
  validates_attachment_content_type :asset, content_type: %w(image/jpg image/pjpeg image/jpeg image/png image/gif) #pjpeg for IE
  validates :title, presence: true, if: :content?
  validates :content, presence: true, if: :title?
end
