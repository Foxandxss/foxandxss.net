class News < ActiveRecord::Base
  attr_accessible :content, :title

  validates :content, :title, presence: true

  paginates_per 5
end
