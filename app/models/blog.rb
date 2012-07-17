class Blog < ActiveRecord::Base
  attr_accessible :status, :name, :url

  belongs_to :status, class_name: "BlogStatus", foreign_key: "blog_statuses_id"
end
