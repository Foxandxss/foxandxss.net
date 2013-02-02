class Option < ActiveRecord::Base
  attr_accessible :name, :value

  validates :name, :value, presence: true
end
