class PageLink < ActiveRecord::Base
  before_save :add_http
  attr_accessible :page, :title, :url

  belongs_to :page
  validates :title, presence: true
  validates :url, presence: true, format: /\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/

  private
    def add_http
      unless self.url =~ URI::regexp
        self.url.insert 0, 'http://'
      end
    end
end
