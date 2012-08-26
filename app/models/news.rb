class News < ActiveRecord::Base
  attr_accessible :content, :title, :image

  has_attached_file :image, styles: { large: "580x150>", thumb: "70x70>" }

  validates :content, :title, presence: true
  validates_attachment_content_type :image, content_type: %w(image/jpg image/pjpeg image/jpeg image/png image/gif) #pjpeg for IE

  paginates_per 5
end
