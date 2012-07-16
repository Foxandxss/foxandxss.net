class PageType < ActiveRecord::Base
  attr_accessible :name, :pages

  has_many :pages, foreign_key: "ptype_id"
end
