class Blog < ActiveRecord::Base
  attr_accessible :status, :name, :url, :blog_statuses_id

  validates :name, :url, :status, :blog_statuses_id, presence: true

  belongs_to :status, class_name: "BlogStatus", foreign_key: "blog_statuses_id"
end