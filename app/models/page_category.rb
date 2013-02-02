class PageCategory < ActiveRecord::Base
  attr_accessible :name, :pages

  has_many :pages, foreign_key: "category_id"

  validates :name, presence: true
end
