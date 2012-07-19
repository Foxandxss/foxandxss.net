class PageLink < ActiveRecord::Base
  attr_accessible :page, :title, :url

  belongs_to :page
end
