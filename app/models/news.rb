class News < ActiveRecord::Base
  attr_accessible :content, :title

  paginates_per 5
end
