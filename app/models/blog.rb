class Blog < ActiveRecord::Base
  attr_accessible :status, :name, :url, :blog_status_id

  validates :name, :url, :status, :blog_status_id, presence: true

  belongs_to :status, class_name: "BlogStatus", foreign_key: "blog_status_id"
end