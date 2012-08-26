class News < ActiveRecord::Base
  attr_accessible :content, :title, :image

  has_attached_file :image, styles: { large: "580x150>", thumb: "70x70>" }

  validates :content, :title, presence: true

  paginates_per 5
end
